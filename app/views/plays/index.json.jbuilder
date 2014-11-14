json.array!(@plays) do |play|
  json.extract! play, :id, :song_id, :at
  json.url play_url(play, format: :json)
end
