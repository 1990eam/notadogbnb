class CreateNotdogs < ActiveRecord::Migration[6.0]
  def change
    create_table :notdogs do |t|
      t.string :name
      t.integer :cost_per_day
      t.string :description
      t.string :address
      t.references :species, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
