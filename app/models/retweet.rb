class Retweet < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates_presence_of :user_id, :tweet_id

  def to_s
    "Retweet from @#{self.tweet.user.username}:\n #{self.tweet.message}"
  end

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
