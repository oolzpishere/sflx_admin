class AddFirstImgToGalleries < ActiveRecord::Migration[5.2]
  def change
  	add_column :galleries, :first_img, :string, default: ''
  end
end
