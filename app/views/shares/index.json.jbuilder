json.array!(@shares) do |share|
  json.extract! share, :id, :hotel_id, :grupo_id, :tipo
  json.url share_url(share, format: :json)
end
