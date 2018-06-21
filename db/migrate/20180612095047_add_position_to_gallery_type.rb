class AddPositionToGalleryType < ActiveRecord::Migration[5.2]
  def change
    add_column :gallery_types, :position, :integer
  end
end
