class User < ApplicationRecord
  before_save :friend_self

  def friend_self
    if FriendRequest.where({ :sender_id => self.id, :receiver_id => self.id}).count == 0
    @friend = FriendRequest.new
    @friend.sender_id = self.id
    @friend.receiver_id = self.id
    @friend.status = "Y"
    @friend.save
  end
  end


  # Direct associations

  has_many   :reviews

  has_many   :inventories,
             :dependent => :destroy

  has_many   :favs, :through => :inventories, :source => :bean

  has_many :friend_requests_where_sender, :class_name => "FriendRequest", :foreign_key => "sender_id"

  has_many :friends_where_sender, :through => :friend_requests_where_sender, :source => :receiver

  has_many :friend_requests_where_receiver, :class_name => "FriendRequest", :foreign_key => "receiver_id"
  
  has_many :friends_where_receiver, :through => :friend_requests_where_receiver, :source => :sender

  has_many :timeline_reviews, :through => :friends_where_sender, :source => :reviews

  has_many :timeline_favorites, :through => :friends_where_sender, :source => :inventories

  has_many :liked_reviews, :through => :likes, :source => :review

  # Indirect associations

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. O thers available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
