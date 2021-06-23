class AddItemImageIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :item_image_id, :integer
  end
end
