class Bean < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :origin_country_id, :presence => true

  validates :roaster_id, :presence => true

end
