class CreateUserLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_locations do |t|
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end

    add_index :user_locations, [:user_id, :location_id], unique: true
  end
end
