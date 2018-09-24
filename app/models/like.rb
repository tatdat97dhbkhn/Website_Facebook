class Like < ApplicationRecord
  belongs_to :user
  belongs_to :article

  ENJOY = 1
  DISLIKE = 0

  scope :find_likes, ->(u_id){where(user_id: u_id, status: Like::ENJOY)}
end
