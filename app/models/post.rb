class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def like
    self.update_attribute(:likes, self.likes+1)
  end
end
