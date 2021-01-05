class Board < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  mount_uploader :board_image, ImageUploader

  paginates_per 20

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
