class Foursquare < ActiveRecord::Base
  attr_accessible :remote_id, :here_now, :rating #, :address, :lat, :long, :name, :phone, :short_url, :status, :tip

  def self.update card, f_id
  	card.props.each do |prop|
  		if prop.k == 'foursquare_rating'
  			prop_id = prop.id
  			# Threads.new do |thread|
  				Foursquare.fetch prop_id, f_id
  				# thread.exit
  			# end
  		end
  	end
  end

  def self.fetch prop_id, f_id
  	require 'net/http'
	endpoint = f_id
	access_keys = 'client_id=' + CLIENT_ID + '&client_secret=' + CLIENT_SECRET
	url = URI.parse('https://api.foursquare.com/v2/venues/' + endpoint + '/' + access_keys)
	req = Net::HTTP::Get.new(URI.encode(url.path))
	binding.pry
	res = Net::HTTP.start(url.host, url.port) do |http|
  		http.request(req)
  	end

  	# Only interested in foursquare specific info
	Prop.find(prop_id).v = res[:response][:venue][:rating]
  end
end
