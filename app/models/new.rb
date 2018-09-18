class New < ApplicationRecord
  # after_create_commit {
  #   NotificationBroadcastJob.perform_later(New.count, self)}

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  NEWS_PARAMS = %w(user_id title content image).freeze
  # mount_uploader :image, PictureUploader
  # validate  :image_size

  private
  def image_size
    return unless image.size > Settings.image.capacity.megabytes
    errors.add :image, "should be less than 5MB"
  end
end
