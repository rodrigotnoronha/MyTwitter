class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.where.not(id: current_user.id)
  end

  def search
    if params[:q].nil?
      @users = []
    else
      @users = User.search params[:q]
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def follow
    #code
  end

  def unfollow
    #code
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
