class TweetBroadcastJob < ApplicationJob
  queue_as :default

  def perform(tweet)
   ActionCable.server.broadcast "timeline_channel", tweet: render_tweet(tweet)
  end

  private
  def render_tweet(tweet)
    TweetsController.render partial: 'tweets/tweet', locals: {tweet: tweet}
  end
end
