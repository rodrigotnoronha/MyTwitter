class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :tweet_reply, class_name: 'Tweet'

  validates_presence_of :tweet_id, :tweet_reply_id
end
