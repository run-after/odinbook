class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Post created!"
      #reload page
      redirect_back(fallback_location: user_path(current_user))
    else
      flash.now[:danger] = "Error creating post"
      render :index
    end
  end

  def index
    @comment = current_user.comments.build
    @like = current_user.likes.build
    # Add user posts
    @posts = current_user.posts.map{|post| post }
    # Add user friends posts
    current_user.friends.each do |friend|
      friend.posts.each {|post| @posts << post }
    end
    # Sort posts by time created 
    @posts = @posts.sort_by(&:created_at).reverse!
    # Starts a new post
    @post = current_user.posts.build
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
