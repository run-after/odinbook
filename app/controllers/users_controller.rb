class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @comment = current_user.comments.build
    @like = current_user.likes.build
    set_image
  end

  def index
    @users = User.all
  end

  private
    def set_image
      if @user.avatar.attachment
        @image = @user.avatar.variant(resize:"400x400")
      # Sets @image from Facebook download locally
      #else
      #  if @user.uid
      #    @image = "#{@user.username.split(' ').join}.png"
      #  end
      end
    end
end
