class LikesController < ApplicationController

  def new
    @like = current_user.likes.build
  end

  def create
    @like = current_user.likes.build(post_id: params[:like][:post_id])
    if @like.save
      redirect_back(fallback_location: user_path(current_user))
      puts "success"
    else
      puts "fail"
    end
  end

end
