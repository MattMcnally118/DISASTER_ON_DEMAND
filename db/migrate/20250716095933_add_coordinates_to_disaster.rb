class AddCoordinatesToDisaster < ActiveRecord::Migration[7.1]
  def change
    add_column :disasters, :latitude, :float
    add_column :disasters, :longitude, :float
  end
end
