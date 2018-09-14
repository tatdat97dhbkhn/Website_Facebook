class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :news, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows
  has_many :follower_relationships, class_name: "Follow",
    foreign_key: "following_id"
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :follower_relationships, class_name: "Follow",
    foreign_key: "user_id"
  has_many :following, through: :follower_relationships, source: :following
end
