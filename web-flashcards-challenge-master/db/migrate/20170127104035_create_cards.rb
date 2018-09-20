class CreateCards < ActiveRecord::Migration
  def change
  	create_table :cards do |t|
  		t.string :question, null: false
  		t.string :answer, null: false
  		t.references :deck

  		t.timestamps(null: false)
  	end
  end
end
