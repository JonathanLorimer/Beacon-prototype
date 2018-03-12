class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.references :country, foreign_key: true
      t.float :greatest_lat
      t.float :least_lat
      t.float :greatest_lng
      t.float :least_lng

      t.timestamps
    end
  end
end
