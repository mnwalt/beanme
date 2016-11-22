class Inventory < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :bean_id, :presence => true

  validates :user_id, :presence => true

end
