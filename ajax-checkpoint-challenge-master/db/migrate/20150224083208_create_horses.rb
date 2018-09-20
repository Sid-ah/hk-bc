class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name,  { null: false }
      t.string :breed, { null: false }
      t.integer :age,  { null: false }

      t.timestamps(null: false)
    end
  end
end
