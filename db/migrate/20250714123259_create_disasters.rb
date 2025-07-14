class CreateDisasters < ActiveRecord::Migration[7.1]
  def change
    create_table :disasters do |t|
      t.string :type
      t.string :location
      t.string :name
      t.text :description
      t.float :intensity
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
