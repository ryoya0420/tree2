class Product < ApplicationRecord
  validates :name,presence: true
  validates :image,presence: true
  validates :price, presence: true
  
  # belongs_to :user
  mount_uploader :image, ImageUploader
end
