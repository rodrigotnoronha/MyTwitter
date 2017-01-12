class Tweet < ApplicationRecord
  belongs_to :user

  validates :message, presence: true, length: {minimum: 2, maximum: 144}
  after_create_commit { TweetBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
