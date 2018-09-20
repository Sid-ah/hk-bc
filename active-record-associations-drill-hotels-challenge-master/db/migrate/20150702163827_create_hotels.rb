class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name

      t.timestamps(null: false)
    end
    execute("INSERT INTO sqlite_sequence (name, seq) VALUES ('hotels', 1000)")
  end
end
