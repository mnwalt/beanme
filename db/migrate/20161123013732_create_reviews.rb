class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :bean_id
      t.float :overall_rating
      t.text :comments
      t.string :image

      t.timestamps

    end
  end
end
