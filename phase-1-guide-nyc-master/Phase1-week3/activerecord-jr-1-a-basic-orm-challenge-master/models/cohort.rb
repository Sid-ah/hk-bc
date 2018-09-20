class Cohort < Database::Model
  def self.all
    Database::Model.execute("SELECT * FROM cohorts").map do |row|
      Cohort.new(row)
    end
  end

  def self.create(attributes)
    record = self.new(attributes)
    record.save

    record
  end

  def self.where(query, *args)
    Database::Model.execute("SELECT * FROM cohorts WHERE #{query}", *args).map do |row|
      Cohort.new(row)
    end
  end

  def self.find(pk)
    self.where('id = ?', pk).first
  end

  self.attribute_names =  [:id, :name, :created_at, :updated_at]

  attr_reader :attributes, :old_attributes

  # e.g., Cohort.new(:id => 1, :name => 'Alpha', :created_at => '2012-12-01 05:54:30')
  def initialize(attributes = {})
    attributes.symbolize_keys!
    raise_error_if_invalid_attribute!(attributes.keys)

    @attributes = {}

    Cohort.attribute_names.each do |name|
      @attributes[name] = attributes[name]
    end

    @old_attributes = @attributes.dup
  end

  def [](attribute)
    raise_error_if_invalid_attribute!(attribute)

    @attributes[attribute]
  end

  def []=(attribute, value)
    raise_error_if_invalid_attribute!(attribute)

    @attributes[attribute] = value
  end

  def students
    Student.where('cohort_id = ?', self[:id])
  end

  def add_students(students)
    students.each do |student|
      student.cohort = self
    end

    students
  end

  def new_record?
    self[:id].nil?
  end

  def save
    if new_record?
      results = insert!
    else
      results = update!
    end

    # When we save, remove changes between new and old attributes
    @old_attributes = @attributes.dup

    results
  end

  private
  def insert!
    self[:created_at] = DateTime.now
    self[:updated_at] = DateTime.now

    fields = self.attributes.keys
    values = self.attributes.values
    marks  = Array.new(fields.length) { '?' }.join(',')

    insert_sql = "INSERT INTO cohorts (#{fields.join(',')}) VALUES (#{marks})"

    results = Database::Model.execute(insert_sql, *values)

    # This fetches the new primary key and updates this instance
    self[:id] = Database::Model.last_insert_row_id
    results
  end

  def update!
    self[:updated_at] = DateTime.now

    fields = self.attributes.keys
    values = self.attributes.values

    update_clause = fields.map { |field| "#{field} = ?" }.join(',')
    update_sql = "UPDATE cohorts SET #{update_clause} WHERE id = ?"

    # We have to use the (potentially) old ID attributein case the user has re-set it.
    Database::Model.execute(update_sql, *values, self.old_attributes[:id])
  end
end
