class AddAlertedToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :alerted, :boolean , default: false
    add_column :photos, :view_times, :integer , default: 0
  end
end
