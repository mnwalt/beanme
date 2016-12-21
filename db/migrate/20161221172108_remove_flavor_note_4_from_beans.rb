class RemoveFlavorNote4FromBeans < ActiveRecord::Migration[5.0]
  def change
    remove_column :beans, :flavor_note_3
  end
end
