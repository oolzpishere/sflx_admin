class CreateGalleryGalleryTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :gallery_gallery_types do |t|
      t.belongs_to :gallery, index: true
      t.belongs_to :gallery_type, index: true
      t.timestamps
    end
    # create_join_table :galleries, :gallery_types do |t|
    #   t.index :gallery_id
    #   t.index :gallery_type_id
    # end
  end
end
