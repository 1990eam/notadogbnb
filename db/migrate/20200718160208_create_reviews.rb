class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :user_review
      t.integer :user_score
      t.string :owner_review
      t.integer :owner_score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
