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

  def index
    @comment = current_user.comments.build
    @like = current_user.likes.build
    @timeline = current_user.posts.map{|post| post }

    current_user.friends.each do |friend|
      friend.posts.each {|post| @timeline << post }
    end 
    @timeline = @timeline.sort_by(&:created_at)
    @post = current_user.posts.build
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
