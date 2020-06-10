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

  devise :omniauthable, omniauth_providers: %i[facebook]

  def befriend(user)
    self.friends << user
    user.friends << self
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name   # assuming the user model has a name
      download = open(auth.info.image)
      IO.copy_stream(download, "app/assets/images/#{user.username.split(' ').join}.png")
      #user.avatar.attach(io: File.open('/app/assets/images/'), filename: "#{user.username.split(' ').join}.png")
      #user.avatar = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
