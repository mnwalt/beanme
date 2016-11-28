class AddRegionLongitudeToBean < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :region_longitude, :float
  end
end
