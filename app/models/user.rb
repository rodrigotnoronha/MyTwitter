class User < ApplicationRecord
  searchkick

  has_many :tweets
  has_many :retweets
  has_many :followings
  has_many :followers, through: :followings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :username

  def follow?(user)
    user.followers.include? self
  end

  def followings_and_me
    users_tweets = Following.where(follower_id: self.id).pluck(:user_id)
    users_tweets << self.id
  end

  def timeline
    @tweets = Tweet.where(user_id: self.followings_and_me).order('created_at desc')
    @retweets = Retweet.where(user_id: self.followings_and_me).order('created_at desc')
    @tweets = @tweets + @retweets
  end
end
