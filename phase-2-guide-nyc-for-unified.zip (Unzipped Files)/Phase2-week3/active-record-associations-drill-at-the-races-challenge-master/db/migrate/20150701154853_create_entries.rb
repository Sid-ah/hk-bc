class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :race_id
      t.integer :jockey_id
      t.integer :horse_id

      t.timestamps(null: false)
    end
  end
end
