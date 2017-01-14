class Following < ApplicationRecord
  searchkick
  belongs_to :user
  belongs_to :follower, class_name: 'User'
end
