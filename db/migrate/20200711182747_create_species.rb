class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :category
      t.string :fantasy_name

      t.timestamps
    end
  end
end
