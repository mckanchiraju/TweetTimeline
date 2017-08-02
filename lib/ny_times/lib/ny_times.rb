require "ny_times/version"
require 'net/https'

module NyTimes
	URI_BASE = "https://api.nytimes.com/svc/search/"

	class Config < Struct.new(:api_key, :params, :version, :format, :type)
	end

	class Request
		def initialize
			yield config if block_given?

			config.version ||= "2"
			config.type ||= "articlesearch"
			config.format ||= "json"
		end

		def call			
			@response ||= Net::HTTP.get(uri)
		end

		def config
			@config ||= Config.new
		end

		private

		def uri
			URI(build_uri)
		end

		def build_uri
			root_url = File.join(URI_BASE, "v#{config.version}", "#{config.type}.#{config.format}?api-key=#{config.api_key}") 
			config.params ? root_url + build_request : root_url
		end

		def build_request
			"&" + config.params.to_a.map { |param| param * "=" }.flatten * "&"
		end
	end
end

#req = NyTimes::Request.new do |config|
#	config.api_key = "8aaf2a4f97a74f7980ecbc88f3d06795"
#	config.params = {
#		q: "trump",
#		start_date: "20170301",
#		end_date: "20170501"
#	}
#end

#res = req.call
