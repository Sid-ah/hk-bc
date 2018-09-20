class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string   :name, { null: false, limit: 50 }
      t.string   :license, { null: false }
      t.integer  :age
      t.integer  :weight
      t.integer  :owner_id

      t.timestamps(null: false)
    end
  end
end
