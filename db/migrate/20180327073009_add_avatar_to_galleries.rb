class AddAvatarToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :avatars, :string
  end
end
