class AddCoverToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :cover, :string
  end
end
