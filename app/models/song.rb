class Song < ActiveRecord::Base
	has_many :plays
	belongs_to :artist, counter_cache: true

	def self.parse_info(attrs)
		print "Got : "
		p attrs

		# Received data in strings, removed whitespaces from end
		artist_name = attrs["fullartist"].try(:strip)
		song_title = attrs["fulltitle"].try(:strip)
		#TODO: Image

		ActiveRecord::Base.transaction do
			artist = Artist.find_by_name(artist_name)
			if !artist
				artist = Artist.create(name: artist_name)
			end

			song = artist.songs.find_by_title(song_title)
			if !song
				song = artist.songs.create(title: song_title)
			end

			last_play = Play.order("at DESC").first
			last_play_of_current = song.plays.order("at DESC").first

			if last_play != last_play_of_current || Play.count == 0
				song.plays.create(at: Time.now)
			end
		end
	end
end
