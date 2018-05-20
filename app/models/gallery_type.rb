class GalleryType < ApplicationRecord
  has_many :gallery_gallery_types
  has_many :galleries, through: :gallery_gallery_types
end
