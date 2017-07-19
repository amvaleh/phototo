class AddPublishedAndPassToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :published, :boolean , default: false
    add_column :photos, :pass, :string
  end
end
