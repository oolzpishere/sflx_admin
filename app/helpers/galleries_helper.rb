module GalleriesHelper
	def first_img(gallery)
		_pos0 = gallery.images.select {|i| i.position == 0}.first
		if !gallery.first_img.empty?
			gallery.images.select {|img| img.image.filename == gallery.first_img}.first
		elsif _pos0
			_pos0
		else
			 gallery.images.first
		end
	end
end
