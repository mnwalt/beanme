class Review < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  belongs_to :bean,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :bean_id, :presence => true

  validates :overall_rating, :presence => true

  validates :overall_rating, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 0 }

  validates :user_id, :presence => true

end
