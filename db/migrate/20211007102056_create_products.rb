class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :image_title
      t.string :image_desc
      t.text :main_image
      t.text :thumb_image
      t.integer :price

      t.timestamps
    end
  end
end
