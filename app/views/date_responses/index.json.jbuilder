json.array!(@date_responses) do |date_response|
  json.extract! date_response, :id, :date_request_id, :date_response_first_name, :date_response_last_name, :date_response_phone, :date_response_username, :date_response_site, :date_response_comment, :date_response_rating
  json.url date_response_url(date_response, format: :json)
end
