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

  def i_follow?
    self.followers.pluck(:follower_id).include? current_user.id
  end

  def followings_and_me
    users_tweets = Following.where(follower_id: self.id).pluck(:user_id)
    users_tweets << self.id
  end
end
