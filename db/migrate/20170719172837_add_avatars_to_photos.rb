class AddAvatarsToPhotos < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos , :avatar
    add_column :photos, :avatars, :string
  end
end
