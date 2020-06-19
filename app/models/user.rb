class User < ApplicationRecord
  require 'open-uri'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  has_many :likes, :dependent => :destroy

  has_many :friend_requests, :dependent => :destroy

  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :dependent => :destroy

  has_one_attached :avatar, :dependent => :destroy

  def befriend(user)
    self.friends << user
    user.friends << self
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name
    end
  end
end
