class Gallery < ApplicationRecord
  has_many :images, dependent: :destroy
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, JSON # If you use SQLite, add this line.

  # accepts_nested_attributes_for :images
  # accepts_nested_attributes_for :images, allow_destroy: true
end
