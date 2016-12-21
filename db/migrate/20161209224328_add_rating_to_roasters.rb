class AddRatingToRoasters < ActiveRecord::Migration[5.0]
  def change
    add_column :roasters, :rating, :float
  end
end
