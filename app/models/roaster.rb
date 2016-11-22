class Roaster < ApplicationRecord
  # Direct associations

  has_many   :beans,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :city, :presence => true

  validates :name, :uniqueness => { :scope => [:city] }

  validates :name, :presence => true

end
