class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :avatar
      t.string :number

      t.timestamps
    end
  end
end
