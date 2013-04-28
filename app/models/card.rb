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
end
