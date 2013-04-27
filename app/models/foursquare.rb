class Foursquare < ActiveRecord::Base
  attr_accessible :remote_id, :here_now, :rating #, :address, :lat, :long, :name, :phone, :short_url, :status, :tip

  def fetch
  	require 'net/http'
	endpoint = self.remote_id
	access_keys = '&client_id=' + CLIENT_ID + '&client_secret=' + CLIENT_SECRET
	url = URI.parse('https://api.foursquare.com/v2/venues/' + endpoint + '/' + access_keys)
	req = Net::HTTP::Get.new(url.path)
	res = Net::HTTP.start(url.host, url.port) do |http|
  		http.request(req)
  	end

  	# Only interested in foursquare specific info
	self.here_now = res[:response][:venue][:hereNow]
	self.rating = res[:response][:venue][:rating]
  end
end
