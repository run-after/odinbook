class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      puts "Comment success"
      redirect_back(fallback_location: user_path(current_user))
    ### want to reload without moving page all the way up
    else
      puts "comment fail"
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
