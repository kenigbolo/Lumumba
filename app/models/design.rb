class Design < ApplicationRecord
  attr_accessor :image
  belongs_to :user
  mount_uploader :image, ImageUploader
end
