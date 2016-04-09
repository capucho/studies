json.array!(@users) do |user|
  json.extract! user, :id, :full_name, :email, :country, :state, :city, :address, :phone_number
  json.url user_url(user, format: :json)
end
