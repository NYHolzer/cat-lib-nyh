class AddLocationsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :location_id, :integer
  end
end
