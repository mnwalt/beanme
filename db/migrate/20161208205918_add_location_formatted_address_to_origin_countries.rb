class AddLocationFormattedAddressToOriginCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :origin_countries, :location_formatted_address, :string
  end
end
