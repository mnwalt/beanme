class ChangeRoasterIdDefaultValueInBeans < ActiveRecord::Migration[5.0]
  def change
    change_column_default :beans, :roaster_id, 'Roaster'
  end
end
