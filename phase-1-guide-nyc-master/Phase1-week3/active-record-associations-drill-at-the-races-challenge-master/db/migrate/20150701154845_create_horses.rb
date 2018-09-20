class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :breed

      t.timestamps(null: false)
    end
  end
end
