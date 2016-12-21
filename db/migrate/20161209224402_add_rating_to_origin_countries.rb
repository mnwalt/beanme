class AddRatingToOriginCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :origin_countries, :rating, :float
  end
end
