json.extract! photo, :id, :first_name, :last_name, :phone, :email, :avatar, :number, :created_at, :updated_at
json.url photo_url(photo, format: :json)
