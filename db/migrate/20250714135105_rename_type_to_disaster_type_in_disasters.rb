class RenameTypeToDisasterTypeInDisasters < ActiveRecord::Migration[7.1]
  def change
    rename_column :disasters, :type, :disaster_type
  end
end
