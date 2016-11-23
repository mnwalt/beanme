class AddLocationLatitudeToRoaster < ActiveRecord::Migration[5.0]
  def change
    add_column :roasters, :location_latitude, :float
  end
end
