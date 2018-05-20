class CreateGalleryTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :gallery_types do |t|
      t.string :gallery_type
    end
  end
end
