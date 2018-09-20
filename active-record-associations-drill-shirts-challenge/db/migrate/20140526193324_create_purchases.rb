class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :purchaser_id
      t.integer :shirt_id

      t.timestamps(null: false)
    end
  end
end
