module Work
  class Gallery < ApplicationRecord
    self.table_name = :galleries
    
    has_many :images, dependent: :destroy
    has_many :gallery_gallery_types
    has_many :gallery_types, through: :gallery_gallery_types
  end
end
