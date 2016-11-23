class AddBeanCountToRoasters < ActiveRecord::Migration[5.0]
  def change
    add_column :roasters, :beans_count, :integer
  end
end
