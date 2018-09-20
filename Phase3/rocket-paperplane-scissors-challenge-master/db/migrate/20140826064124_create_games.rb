class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :computer_throw
      t.string :user_throw
      t.timestamps
    end
  end
end
