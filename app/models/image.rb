class Image < ApplicationRecord
  belongs_to :gallery
  
  has_attached_file :image, styles: { w768: "768>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment :image, presence: true,
                       # content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                       size: { in: 0..10.megabytes }
end
