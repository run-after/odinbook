class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      puts "SUCCESS"### set up flash message
      
      redirect_back(fallback_location: user_path(current_user))
    else
      puts "FAILED"#### will need to render error message
    end
  end

  def update
    Post.find(params[:id]).like
    redirect_back(fallback_location: user_path(current_user))
  end

  def index
    @post = current_user.posts.build
    @timeline = Post.where(["user_id = ?", current_user.id])
    
    @comment = current_user.comments.build
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
