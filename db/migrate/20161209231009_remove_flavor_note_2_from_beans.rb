class RemoveFlavorNote2FromBeans < ActiveRecord::Migration[5.0]
  def change
      remove_column :beans, :flavor_note_2
  end
end
