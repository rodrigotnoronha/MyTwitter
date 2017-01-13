class TweetBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data, user_id)
    tweet = User.find(user_id).tweets.create! message: data['tweet']['message']
    User.find(user_id).followers.each do |follower|
      ActionCable.server.broadcast "users:#{follower.id}:timeline_channel", tweet: render_tweet(tweet)
    end
    ActionCable.server.broadcast "users:#{user_id}:timeline_channel", tweet: render_tweet(tweet)
  end

  private
  def render_tweet(tweet)
    TweetsController.render partial: 'tweets/tweet', locals: {tweet: tweet}
  end
end
