class CreateTaxonomies < ActiveRecord::Migration[6.0]
  def change
    create_table :taxonomies do |t|
      t.string :name
      t.string :category
      t.string :fantasy_name
      t.references :notdog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
