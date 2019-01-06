module Work
  class Image < ApplicationRecord
    self.table_name = :images

    belongs_to :gallery
    has_one_attached :image
    # has_attached_file :image, styles: { w768: "768>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    #
    # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    # validates_attachment :image, presence: true,
    #                      # content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    #                      size: { in: 0..10.megabytes }
    # attr_accessible :image
    include Rails.application.routes.url_helpers
    def to_jq_upload

      {
        "name" => image.filename,
        "size" => image.byte_size,
        "url" => rails_blob_path(image, only_path: true),
        "thumbnailUrl" => rails_representation_path(image.variant(resize: "150"), only_path: true),
        "deleteUrl" => admin_image_path(self),
        "deleteType" => "DELETE"
      }
    end

  end
end
