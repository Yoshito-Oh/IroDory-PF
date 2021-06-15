class AddImageIdToItemImages < ActiveRecord::Migration[5.2]
  def change
    add_column :item_images, :image_id, :string
  end
end
