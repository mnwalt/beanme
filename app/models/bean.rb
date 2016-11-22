class Bean < ApplicationRecord
  # Direct associations

  belongs_to :roaster,
             :counter_cache => true

  belongs_to :country,
             :class_name => "OriginCountry",
             :foreign_key => "origin_country_id",
             :counter_cache => true

  has_many   :reviews,
             :dependent => :destroy

  has_many   :inventories,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:roaster_id] }

  validates :name, :presence => true

  validates :origin_country_id, :presence => true

  validates :roaster_id, :presence => true

end
