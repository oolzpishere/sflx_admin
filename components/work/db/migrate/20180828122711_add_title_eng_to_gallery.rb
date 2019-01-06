class AddTitleEngToGallery < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :title_eng, :string
  end
end
