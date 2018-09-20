class New < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  NEWS_PARAMS = %w(user_id title content image status public_time).freeze
end
