class Gallery < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :gallery_gallery_types
  has_many :gallery_types, through: :gallery_gallery_types
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, JSON # If you use SQLite, add this line.



  # accepts_nested_attributes_for :images
  # accepts_nested_attributes_for :images, allow_destroy: true
end
