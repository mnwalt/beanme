class Response < ApplicationRecord

  validates :user_id, :presence => true
  validates :review_id, :presence => true
  validates :body, :presence => true

  belongs_to :review
  belongs_to :user

end
