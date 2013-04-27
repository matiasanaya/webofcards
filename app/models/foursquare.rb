class Foursquare < ActiveRecord::Base
  attr_accessible :address, :here_now, :lat, :long, :name, :phone, :rating, :remote_id, :short_url, :status, :tip
end
