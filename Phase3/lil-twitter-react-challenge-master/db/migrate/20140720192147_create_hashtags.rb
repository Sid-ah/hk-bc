class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |column|
      column.string :name
    end
  end
end
