class RecolumnStatusToPostImages < ActiveRecord::Migration[5.2]
  def change
    change_column :post_images, :status, :boolean, default: false
  end
end
