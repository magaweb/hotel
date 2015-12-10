json.array!(@grupos) do |t|
  json.extract! t, :id, :name
  json.url hotel_url(t, format: :json)
end
