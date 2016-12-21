class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :heading
      t.string :image_url
      t.text :content
      t.string :link
      t.string :misc

      t.timestamps
    end
  end
end
