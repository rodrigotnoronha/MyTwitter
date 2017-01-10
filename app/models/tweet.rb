class Tweet < ApplicationRecord
  validates :message, presence: true, length: {minimum: 1, maximum: 144}
  after_create_commit { TweetBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
