class Borg
  @@borg_count = 0

  def self.count
    @@borg_count
  end

  def initialize
    self.class.increment_borg_count

    @id = self.class.count
  end

  def name
    "#{id} of #{@@borg_count}"
  end

  private
  def self.increment_borg_count
    @@borg_count += 1
  end

  attr_reader :id
end
