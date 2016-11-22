class Review < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :overall_rating, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 0 }

  validates :user_id, :presence => true

end
