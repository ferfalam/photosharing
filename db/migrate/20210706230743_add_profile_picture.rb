class AddProfilePicture < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :text, default: "default.png"
  end
end
