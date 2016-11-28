class AddRegionFormattedAddressToBean < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :region_formatted_address, :string
  end
end
