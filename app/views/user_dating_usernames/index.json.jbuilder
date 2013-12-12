json.array!(@user_dating_usernames) do |user_dating_username|
  json.extract! user_dating_username, :id, :dating_site_id, :user_id, :dating_site_username
  json.url user_dating_username_url(user_dating_username, format: :json)
end
