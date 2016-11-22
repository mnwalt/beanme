class Bean < ApplicationRecord
  # Direct associations

  has_many   :inventories,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:roaster_id] }

  validates :name, :presence => true

  validates :origin_country_id, :presence => true

  validates :roaster_id, :presence => true

end
