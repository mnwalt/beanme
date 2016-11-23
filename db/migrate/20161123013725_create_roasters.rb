class CreateRoasters < ActiveRecord::Migration
  def change
    create_table :roasters do |t|
      t.text :description
      t.string :name
      t.string :website_url
      t.string :location
      t.string :cover_photo_url
      t.string :city
      t.boolean :delivers
      t.string :delivery_method
      t.text :delivery_notes
      t.string :delivery_geography

      t.timestamps

    end
  end
end
