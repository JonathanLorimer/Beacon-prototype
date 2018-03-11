class AddLatLongColumnsToContinents < ActiveRecord::Migration[5.1]
  def change
    add_column :continents, :greatest_lat, :integer
    add_column :continents, :least_lat, :integer
    add_column :continents, :greatest_lng, :integer
    add_column :continents, :least_lng, :integer
  end
end
