class FollowingsController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    if params[:q].nil?
      @followings = Following.where(follower_id: current_user.id).limit(50)
    else
      @followings = Following.search params[:q], where: { follower_id: current_user.id }
    end
  end

end
