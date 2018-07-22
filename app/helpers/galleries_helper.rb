module GalleriesHelper
	def first_img(gallery)
		gallery.first_img.empty? ? gallery.images.first : gallery.images.select {|img| img.image.filename == gallery.first_img}.first
	end
end
