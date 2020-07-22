class AddAnswerToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :answer, :text
  end
end
