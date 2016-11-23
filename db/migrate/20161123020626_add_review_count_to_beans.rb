class AddReviewCountToBeans < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :reviews_count, :integer
  end
end
