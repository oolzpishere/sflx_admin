module Work
  class GalleryGalleryType < ApplicationRecord
    self.table_name = :gallery_gallery_types

    belongs_to :gallery
    belongs_to :gallery_type
  end
end
