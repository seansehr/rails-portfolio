class Project < ActiveRecord::Base
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true
  has_many :comments, as: :commentable
  mount_uploader :image, ImageUploader
end
