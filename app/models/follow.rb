class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: "user_id", class_name: "User"
  belongs_to :following, class_name: "User", foreign_key: "following_id"
end
