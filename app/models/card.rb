class Card < ActiveRecord::Base
  attr_accessible :name

  has_many :props
end
