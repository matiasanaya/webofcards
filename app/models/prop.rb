class Prop < ActiveRecord::Base
  attr_accessible :k, :v, :card_id

  belongs_to :card
end
