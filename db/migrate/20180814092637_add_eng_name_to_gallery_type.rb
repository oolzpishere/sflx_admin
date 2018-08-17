class AddEngNameToGalleryType < ActiveRecord::Migration[5.2]
  def change
    add_column :gallery_types, :eng_name, :string
  end
end
