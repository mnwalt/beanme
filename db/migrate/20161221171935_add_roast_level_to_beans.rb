class AddRoastLevelToBeans < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :roast_level, :string
  end
end
