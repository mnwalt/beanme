class Inventory < ApplicationRecord
  # Direct associations

  belongs_to :bean

  # Indirect associations

  # Validations

  validates :bean_id, :presence => true

  validates :user_id, :presence => true

end
