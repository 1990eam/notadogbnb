class RemoveTaxonomies < ActiveRecord::Migration[6.0]
  def change
    drop_table :taxonomies
  end
end
