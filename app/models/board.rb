class Board < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 255 }
  validates :body, length: { maximum: 65535 }
end
