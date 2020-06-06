class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  has_many :likes

  has_many :friend_requests

  has_many :friendships
  has_many :friends, :through => :friendships

  def befriend(user)
    self.friends << user
    user.friends << self
  end
end
