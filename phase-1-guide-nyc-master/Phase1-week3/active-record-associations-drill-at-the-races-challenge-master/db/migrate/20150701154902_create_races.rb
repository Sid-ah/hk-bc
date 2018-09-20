class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :location
      t.date   :date

      t.timestamps(null: false)
    end
  end
end
