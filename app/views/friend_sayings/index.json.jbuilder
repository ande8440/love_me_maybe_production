json.array!(@friend_sayings) do |friend_saying|
  json.extract! friend_saying, :id, :saying
  json.url friend_saying_url(friend_saying, format: :json)
end
