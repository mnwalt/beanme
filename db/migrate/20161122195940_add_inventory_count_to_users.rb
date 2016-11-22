class AddInventoryCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :inventories_count, :integer
  end
end
