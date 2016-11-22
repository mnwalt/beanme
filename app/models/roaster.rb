class Roaster < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :city, :presence => true

  validates :name, :uniqueness => { :scope => [:city] }

  validates :name, :presence => true

end
