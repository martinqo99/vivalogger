json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :songs_count
  json.url artist_url(artist, format: :json)
end
