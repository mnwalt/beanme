class AddLocationLatitudeToOriginCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :origin_countries, :location_latitude, :float
  end
end
