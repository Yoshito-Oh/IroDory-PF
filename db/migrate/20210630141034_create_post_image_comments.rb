class CreatePostImageComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_image_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :post_image_id

      t.timestamps
    end
  end
end
