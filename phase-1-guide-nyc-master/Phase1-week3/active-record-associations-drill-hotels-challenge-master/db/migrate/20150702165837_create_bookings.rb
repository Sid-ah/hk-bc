class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :guest_id
      t.integer :room_id

      t.timestamps(null: false)
    end
    execute("INSERT INTO sqlite_sequence (name, seq) VALUES ('bookings', 3000)")
  end
end
