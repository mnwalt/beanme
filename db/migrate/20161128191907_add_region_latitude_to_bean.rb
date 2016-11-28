class AddRegionLatitudeToBean < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :region_latitude, :float
  end
end
