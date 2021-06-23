class AddProfileHeaderIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_header_id, :string
  end
end
