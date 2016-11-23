class ChangeNameDefaultValueInBeans < ActiveRecord::Migration[5.0]
  def change
    change_column_default :beans, :name, 'Name'
  end
end
