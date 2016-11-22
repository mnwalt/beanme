class CreateBeans < ActiveRecord::Migration
  def change
    create_table :beans do |t|
      t.string :name
      t.integer :roaster_id
      t.string :website_url
      t.string :image_url
      t.string :flavor_note_1
      t.string :flavor_note_2
      t.string :flavor_note_3
      t.float :price_per_bag
      t.integer :std_bag_size_in_ounces
      t.integer :elevation_low
      t.integer :elevation_high
      t.string :process
      t.string :varietal
      t.integer :origin_country_id
      t.boolean :caffine
      t.boolean :blend
      t.boolean :espresso

      t.timestamps

    end
  end
end
