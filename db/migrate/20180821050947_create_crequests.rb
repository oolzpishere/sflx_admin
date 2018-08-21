class CreateCrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :crequests do |t|
      t.string :name
      t.integer :phone
      t.text :request

      t.timestamps
    end
  end
end
