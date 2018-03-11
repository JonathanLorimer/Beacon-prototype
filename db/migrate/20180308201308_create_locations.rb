class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :category
      t.references :district, foreign_key: true
      t.references :category_achievement, foreign_key: true

      t.timestamps
    end
  end
end
