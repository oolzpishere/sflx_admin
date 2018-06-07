class Gallery < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :gallery_gallery_types
  has_many :gallery_types, through: :gallery_gallery_types


  # accepts_nested_attributes_for :images
  # accepts_nested_attributes_for :images, allow_destroy: true
end
