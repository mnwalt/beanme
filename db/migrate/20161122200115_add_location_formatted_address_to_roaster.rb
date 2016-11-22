class AddLocationFormattedAddressToRoaster < ActiveRecord::Migration[5.0]
  def change
    add_column :roasters, :location_formatted_address, :string
  end
end
