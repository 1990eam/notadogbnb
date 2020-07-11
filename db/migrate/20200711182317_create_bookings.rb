class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :notdog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :time

      t.timestamps
    end
  end
end
