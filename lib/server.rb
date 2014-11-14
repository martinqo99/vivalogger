# Not really server, but doesnt matter
class Server
	def self.run
		url = "http://player.radioviva.sk/info.php?get=player"
		Rails.logger.info "Starting server..."

		while true
			# Waiting before fetching, error states may skip sleep and will
			# fetch indefinitely, doing DOS
			Rails.logger.info "Sleeping ..."
			sleep(40 + rand(30))

			# Original request (HTTP::Message)
			rq = HTTPClient.get(url)

			# If not valid response from server, skip processing
			if rq.code != 200
				Rails.logger.error("SERVER: Cannot fetch info! Code : #{rq.code}")
				next
			end

			# JSON -> ruby hash
			begin
				data = JSON.parse(rq.body)
			rescue JSON::ParserError
				Rails.logger.error("SERVER: Cannot parse input '#{eq.json}'")
				next
			end

			# Core processing
			Song.parse_info(data)
		end
	end
end
