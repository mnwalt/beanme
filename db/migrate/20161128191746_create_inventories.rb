class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :user_id
      t.integer :bean_id
      t.float :quantity_ounces
      t.date :roast_date

      t.timestamps

    end
  end
end
