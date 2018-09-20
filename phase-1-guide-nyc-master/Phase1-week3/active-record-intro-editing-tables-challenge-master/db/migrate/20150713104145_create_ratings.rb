class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :coolness
      t.integer :cuteness
      t.integer :rater_id
      t.integer :dog_id

      t.timestamps(null: false)
    end
  end
end
