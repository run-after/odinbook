class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_back(fallback_location: user_path(current_user))
    else
      flash[:danger] = "Error creating comment"
      redirect_back(fallback_location: user_path(current_user))
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
