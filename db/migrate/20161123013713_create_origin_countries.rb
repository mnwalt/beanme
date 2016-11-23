class CreateOriginCountries < ActiveRecord::Migration
  def change
    create_table :origin_countries do |t|
      t.text :description
      t.string :cover_photo_url
      t.string :name

      t.timestamps

    end
  end
end
