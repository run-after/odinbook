class FriendshipsController < ApplicationController
  def new
    @requests = current_user.friend_requests.all
  end

  def create
    # calls User#befriend to add friend to both parties
    current_user.befriend(User.find(params[:friend_id]))
    # deletes the friend request
    current_user.friend_requests.find_by(requester_id: params[:friend_id]).delete
    # refreshes page
    redirect_back(fallback_location: user_path(current_user))
  end

  def destroy
  end
end
