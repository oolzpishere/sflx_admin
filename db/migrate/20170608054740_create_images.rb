class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.belongs_to :gallery, index: true
      t.integer :position
      t.attachment :image
      
      t.timestamps
    end

    
  end
end
