class OriginCountry < ApplicationRecord
  # Direct associations

  has_many   :beans,
             :dependent => :destroy

  # Indirect associations

  has_many   :reviews,
             :through => :beans,
             :source => :reviews

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
