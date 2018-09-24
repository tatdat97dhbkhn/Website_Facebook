class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: "user_id", class_name: "User"
  belongs_to :following, class_name: "User", foreign_key: "following_id"

  scope :list_followings, ->(current) { where(user_id: current)}
  scope :list_followers, ->(id_user) {where(following_id: id_user)}
  scope :exam_follow, ->(id_user, id_follow) {where(user_id: id_user,
    following_id: id_follow)}
end
