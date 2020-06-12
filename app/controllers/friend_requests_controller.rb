class FriendRequestsController < ApplicationController
  def create
    @friend_request = FriendRequest.new(user_id: params[:user_id], requester_id: current_user.id)
    if @friend_request.save
      flash[:success] = "Friend requested!"
      redirect_back(fallback_location: user_path(current_user))
    end
  end
end
