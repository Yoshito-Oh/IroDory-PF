class AddPostImageIdToItemImages < ActiveRecord::Migration[5.2]
  def change
    add_column :item_images, :post_image_id, :integer
  end
end
