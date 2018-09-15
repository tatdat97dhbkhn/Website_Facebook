class Article < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :approved_article, ->{where(status: APPROVED)}
  scope :notapproved_article, -> { where(status: NOT_APPROVED)}
  scope :count_noti, ->{where(watched: NOT_WATCHED, status: NOT_APPROVED)}
  scope :count_user_noti, ->(u_id){where(user_watched: USER_NOT_WATCHED,
    status: APPROVED, user_id: u_id)}
  scope :count_feedback, -> (u_id){where("status = #{APPROVED} and watched = #{WATCHED} and user_id = #{u_id}")}
  scope :order_id, ->(sort){order id: sort}
  scope :order_public_time, ->(time){where("public_time <= ?",time)}
  scope :sort_likes, -> (sort){ order count_likes: sort}
  scope :sort_time, ->(sort){order public_time: sort}
  scope :order_created, ->(sort){order created_at: sort}
  scope :more_article, ->(article_last){where(status: APPROVED,
    id: (1...article_last.to_i))}                       
  scope :find_news, ->(u_id){where(user_id: u_id, status: Article::APPROVED)}
  scope :find_news_feed, ->(u_id){where("user_id = #{u_id} and status = #{APPROVED} and user_watched != #{USER_WATCHED}")}
  scope :art_current_user, ->(id){where(user_id: id)}

  ARTICLE_PARAMS = %w(user_id title content image public_time).freeze
  LIMIT_ARTICLES = 2
  APPROVED = 1
  NOT_APPROVED = 0
  WATCHED = 2
  NOT_WATCHED = 0
  SHOWED = 1
  USER_NOT_WATCHED = 0
  USER_SHOWED = 1
  USER_WATCHED = 2
  STATUSES = {
    APPROVED => "Approved",
    NOT_APPROVED => "Not approved yet"
  }.freeze
  validates :title, presence: true
  validates :content, presence: true
  validates :public_time, presence: true
  mount_uploader :image, PictureUploader
  validate :image_size

  private
  def image_size
    return unless image.size > Settings.image.capacity.megabytes
    errors.add :image, "should be less than 5MB"
  end
end
