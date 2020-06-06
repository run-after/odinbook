class FriendRequestsController < ApplicationController
  def create
    #creates new friend request
    @friend_request = FriendRequest.new(user_id: params[:user_id], requester_id: current_user.id)
    if @friend_request.save
      puts "success"
      redirect_back(fallback_location: user_path(current_user))
    else
      puts "Failed"
    end
  end

  def destroy

  end
end
