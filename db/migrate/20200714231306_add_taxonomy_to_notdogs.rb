class AddTaxonomyToNotdogs < ActiveRecord::Migration[6.0]
  def change
    add_column :notdogs, :taxonomy_name, :string
    add_column :notdogs, :taxonomy_fantasy_name, :string
    add_column :notdogs, :taxonomy_category, :string
  end
end
