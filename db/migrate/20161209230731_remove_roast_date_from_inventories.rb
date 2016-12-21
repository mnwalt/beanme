class RemoveRoastDateFromInventories < ActiveRecord::Migration[5.0]
  def change
    remove_column :inventories, :roast_date
  end
end
