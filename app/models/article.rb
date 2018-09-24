class Article < ApplicationRecord
  # after_create_commit {
  #   NotificationBroadcastJob.perform_later(Article.count, self)}

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :approved_article, ->{where(status: APPROVED)}
  scope :order_id, ->(sort){order id: sort}
  scope :order_created, ->(sort){order created_at: sort}
  scope :more_article, ->(article_last){where(status: APPROVED,
    id: (1...article_last.to_i))}                       
  scope :find_news, ->(u_id){where(user_id: u_id, status: Article::APPROVED)}

  ARTICLE_PARAMS = %w(user_id title content image public_time).freeze
  LIMIT_ARTICLES = 2
  APPROVED = 1
  NOT_APPROVED = 0
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
