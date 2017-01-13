class FollowersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    if params[:q].nil?
      @followers = current_user.followers.where.not(id: current_user.id).limit(50)
    else
      @followers = current_user.followers.search params[:q]
    end
  end

end
