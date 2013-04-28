class Card < ActiveRecord::Base
  attr_accessible :name, :privacy

  has_many :props

  def head
  	'Matias Anaya'
  end

  def is_public?
  	return false if privacy == 'private'
  	return true
  end

  def to_custom_json
  	self.to_jbuilder.target!
  end

  def to_jbuilder
    Jbuilder.new do |card|
			# Card attributes
			card.extract! self, :id, :name
			# Childs
			card.properties self.props do |prop|
				card.set! prop.k, prop.v
			end
    end
	end
end
