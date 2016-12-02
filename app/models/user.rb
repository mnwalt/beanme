class User < ApplicationRecord
  # Direct associations

  has_many   :reviews

  has_many   :inventories,
             :dependent => :destroy

  has_many   :favs, :through => :inventories, :source => :bean

  # Indirect associations

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. O thers available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
