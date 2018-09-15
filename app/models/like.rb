class Like < ApplicationRecord
  belongs_to :user
  belongs_to :article

  ENJOY = 1
  DISLIKE = 0

  scope :find_likes, ->(u_id){where(user_id: u_id, status: Like::ENJOY)}
  scope :count_likes, ->(a_id){where(article_id: a_id, status: Like::ENJOY)}
  scope :count_unlikes, ->(a_id){where(article_id: a_id, status: Like::DISLIKE)}
  scope :like_destroy, ->(u_id, art_id, sta){where(user_id: u_id, 
    article_id: art_id, status: sta)}
  scope :status_like, ->(u_id, art_id, sta){where(user_id: u_id,
    article_id: art_id, status: sta)}
  scope :list_likes, ->{where(status: ENJOY)}
  scope :list_unlike, ->{where(status: DISLIKE)}
end
