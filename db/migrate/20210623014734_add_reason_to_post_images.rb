class AddReasonToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :reason, :text
  end
end
