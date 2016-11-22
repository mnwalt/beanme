class Review < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :user,
             :counter_cache => true

  belongs_to :bean,
             :counter_cache => true

  # Indirect associations

  has_one    :roaster,
             :through => :bean,
             :source => :roaster

  has_one    :country,
             :through => :bean,
             :source => :country

  # Validations

  validates :bean_id, :presence => true

  validates :overall_rating, :presence => true

  validates :overall_rating, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 0 }

  validates :user_id, :presence => true

end
