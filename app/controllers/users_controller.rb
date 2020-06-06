class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @comment = current_user.comments.build
  end

  def index
    @users = User.all
  end
end
