class AddLocationLongitudeToRoaster < ActiveRecord::Migration[5.0]
  def change
    add_column :roasters, :location_longitude, :float
  end
end
