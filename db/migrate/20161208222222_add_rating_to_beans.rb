class AddRatingToBeans < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :rating, :float
  end
end
