class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.string :guess_body, null: false
  		t.references :round
  		t.references :card

  		t.timestamps(null: false)
  	end
  end
end
