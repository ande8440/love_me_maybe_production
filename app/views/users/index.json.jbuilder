json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :user_email, :user_phone, :user_handle, :admin, :password_digest, :remember_token, :user_password, :user_password_confirmation
  json.url user_url(user, format: :json)
end
