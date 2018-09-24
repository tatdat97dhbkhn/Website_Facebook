class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :articles, dependent: :destroy, inverse_of: :user
  
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

  
 scope :find_user, -> (name){ where("name LIKE ?", "%#{name}%")}

  mount_uploader :image, PictureUploader

  validates :name, presence: true,
    length: {maximum: Settings.user.length.max_name}
  validate  :image_size

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
        session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = URI.parse auth.info.image
      user.skip_confirmation!
      user.confirm
      user.save!
    end
  end

  private
  def image_size
    return unless image.size > Settings.image.capacity.megabytes
    errors.add :image, "should be less than 5MB"
  end
end
