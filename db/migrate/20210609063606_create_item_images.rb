class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.integer :tag_id
      t.string :item_title
      t.text :item_introduction
      t.string :status

      t.timestamps
    end
  end
end
