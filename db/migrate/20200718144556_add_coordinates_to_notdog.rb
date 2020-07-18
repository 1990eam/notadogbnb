class AddCoordinatesToNotdog < ActiveRecord::Migration[6.0]
  def change
    add_column :notdogs, :latitude, :float
    add_column :notdogs, :longitude, :float
  end
end
