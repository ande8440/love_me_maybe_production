json.array!(@date_requests) do |date_request|
  json.extract! date_request, :id, :user_id, :first_name, :last_name, :date_phone, :date_username, :date_username_site, :date_comment, :date_rating
  json.url date_request_url(date_request, format: :json)
end
