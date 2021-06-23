class AddItemImageIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :item_image_id, :integer
  end
end
