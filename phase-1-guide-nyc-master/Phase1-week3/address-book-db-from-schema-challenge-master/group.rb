class Group
  attr_reader :id, :created_at, :updated_at
  attr_accessor :name

  def initialize(args = {})
    assign_attributes(args)
  end

  def destroy
    $db.execute("DELETE FROM groups WHERE id = ?", self.id)
  end

  def save
    persisted? ? update : insert
    return self
  end

  def ==(other)
    return true if self.object_id == other.object_id
    return false unless persisted?
    return false unless other.is_a? Group

    self.id == other.id
  end

  def self.count
    $db.get_first_value("SELECT COUNT() FROM groups;")
  end

  def self.all
    groups_from($db.execute("SELECT * FROM groups;"))
  end

  def self.where(conditions)
    groups_from($db.execute("SELECT * FROM groups WHERE #{build_conditions_with_placeholders(conditions.keys)};", *conditions.values))
  end

  def self.find(id)
    groups_from($db.execute("SELECT * FROM groups WHERE id = ? LIMIT 1", id)).first
  end

  private
  attr_writer :id

  def created_at=(date)
    @created_at = date_from(date)
  end

  def updated_at=(date)
    @updated_at = date_from(date)
  end

  def date_from(date)
    return unless date
    return date if date.kind_of? Date
    DateTime.parse(date)
  end

  def assign_attributes(args = {})
    self.id         = args["id"]
    self.name       = args["name"]
    self.created_at = args["created_at"]
    self.updated_at = args["updated_at"]
  end

  def persisted?
    !id.nil?
  end

  def insert
    $db.execute("INSERT INTO groups (name, created_at, updated_at) VALUES (?, DATETIME('now'), DATETIME('now'));", self.name)
    assign_attributes($db.execute("SELECT * FROM groups WHERE id = ? LIMIT 1", $db.last_insert_row_id).first)
  end

  def update
    $db.execute("UPDATE groups SET name = ?, updated_at = DATETIME('now') WHERE id = ?", self.name, self.id)
    assign_attributes($db.execute("SELECT * FROM groups WHERE id = ? LIMIT 1", self.id).first)
  end

  def self.groups_from(results)
    results.map { |group_data| new(group_data) }
  end

  def self.build_conditions_with_placeholders(columns)
    columns.map { |column| "#{column} = ?" }.join(" AND ")
  end
end


