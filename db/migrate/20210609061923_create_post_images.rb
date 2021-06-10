class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :user_id
      t.integer :tag_id
      t.string :title
      t.text :img_introduction
      t.string :art_supplies
      t.string :status

      t.timestamps
    end
  end
end
