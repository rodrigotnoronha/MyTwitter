class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.where(user_id: current_user.followings_and_me).order('created_at desc')
    @tweet = Tweet.new
  end
end
