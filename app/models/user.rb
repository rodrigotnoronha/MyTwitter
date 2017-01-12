require 'elasticsearch/model'

class User < ApplicationRecord
  include Elasticsearch::Model

  has_many :tweets
  has_many :followings
  has_many :followers, through: :followings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :username

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['username', 'name', 'email']
          }
        }
      }
    )
  end
end
