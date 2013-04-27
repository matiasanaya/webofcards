class Prop < ActiveRecord::Base
  attr_accessible :k, :v

  belongs_to :card
end
