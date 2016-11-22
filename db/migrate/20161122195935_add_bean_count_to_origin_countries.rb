class AddBeanCountToOriginCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :origin_countries, :beans_count, :integer
  end
end
