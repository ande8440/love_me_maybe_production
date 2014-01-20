json.array!(@yes_sayings) do |yes_saying|
  json.extract! yes_saying, :id, :saying
  json.url yes_saying_url(yes_saying, format: :json)
end
