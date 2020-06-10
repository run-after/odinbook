class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @comment = current_user.comments.build
    @like = current_user.likes.build
  end

  def index
    @users = User.all
  end
end
