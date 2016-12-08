class Review < ApplicationRecord
  before_save :update_rating

  def update_rating
    bean = self.bean
    reviews = Review.where(:bean_id => bean.id)
    ratings = reviews.pluck(:overall_rating)
    avg_rating = ratings.sum.to_f / ratings.count
    if ratings.count >0
      bean.rating = avg_rating
      bean.save
    else
      bean.rating = 0
      bean.save
    end
  end

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
