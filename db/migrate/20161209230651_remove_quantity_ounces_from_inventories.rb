class RemoveQuantityOuncesFromInventories < ActiveRecord::Migration[5.0]
  def change
    remove_column :inventories, :quantity_ounces
  end
end
