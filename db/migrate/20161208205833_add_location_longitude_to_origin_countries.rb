class AddLocationLongitudeToOriginCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :origin_countries, :location_longitude, :float
  end
end
