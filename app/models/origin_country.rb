class OriginCountry < ApplicationRecord
  # Direct associations

  has_many   :beans,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
