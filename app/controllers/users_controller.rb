class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :follow, :unfollow]

  # GET /users
  # GET /users.json
  def index
    if params[:q].nil?
      @users = User.where.not(id: current_user.id).limit(50)
    else
      @users = User.search params[:q]
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @followers = @user.followers.joins(:users)
  end

  def follow
    @following = Following.new(user: @user , follower: current_user)
    if @following.save
      render :show
    end
  end

  def unfollow
    #code
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
