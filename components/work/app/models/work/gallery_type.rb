module Work
  class GalleryType < ApplicationRecord
    self.table_name = :gallery_types

    has_many :gallery_gallery_types
    has_many :galleries, through: :gallery_gallery_types
  end
end
