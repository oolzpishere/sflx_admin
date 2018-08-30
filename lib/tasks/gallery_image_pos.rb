# require_relative 'lib/tasks/gallery_image_pos'  # paste to console
module Sflx
  def update_gallery_image_pos
    Gallery.all.each do |g|
      g.images.each do |img|
        _name = img.image_blob.filename.to_s
        # not include any number then to_s => nil, nil.to_i => 0
        # pos = _name.match(/-?\d+/).to_s.to_i
        pos = _name.match(/\d+/).to_s.to_i
        img.update(position: pos)
      end
    end
  end
# update_gallery_image_pos

end
