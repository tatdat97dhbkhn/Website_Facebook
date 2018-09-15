class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

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

  USER_CREATE_PARAMS = %w(name email password image).freeze
  USER_UPDATE_PARAMS = %w(password current_password).freeze

  mount_uploader :image, PictureUploader

  validates :name, presence: true,
    length: {maximum: Settings.user.length.max_name}
  validate  :image_size

  private
  def image_size
    return unless image.size > Settings.image.capacity.megabytes
    errors.add :picture, "should be less than 5MB"
  end
end
