class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :favourites
  has_many :fans, :through => :favourites, :source => :user
end
