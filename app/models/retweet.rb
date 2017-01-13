class Retweet < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates_presence_of :user_id, :tweet_id
end
