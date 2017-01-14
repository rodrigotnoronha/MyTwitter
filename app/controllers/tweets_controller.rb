class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: :retweet

  def index
    @tweets = current_user.timeline.sort_by(&:created_at).reverse
    @tweet = Tweet.new
  end

  def retweet
    @retweet = Retweet.new user_id: current_user.id, tweet_id: @tweet.id
    if @retweet.save
      render :index
    end
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
