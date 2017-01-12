class User < ApplicationRecord
  searchkick

  has_many :tweets
  has_many :followings
  has_many :followers, through: :followings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :username
end
