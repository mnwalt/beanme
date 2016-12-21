class Like < ApplicationRecord

  validates :user_id, :presence => true, :uniqueness => { :scope => :review}
  validates :review_id, :presence => true

  belongs_to :review

  belongs_to :user

end
