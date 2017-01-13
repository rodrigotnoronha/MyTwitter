class Tweet < ApplicationRecord
  has_many :replies
  has_many :tweets_reply, through: :replies
  has_many :retweets
  belongs_to :user

  validates :message, presence: true, length: {minimum: 2, maximum: 144}
  validates_presence_of :user_id
  
  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
