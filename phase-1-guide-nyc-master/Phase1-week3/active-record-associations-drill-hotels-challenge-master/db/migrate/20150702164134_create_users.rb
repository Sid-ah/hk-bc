class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps(null: false)
    end
    execute("INSERT INTO sqlite_sequence (name, seq) VALUES ('users', 2000)")
  end
end
