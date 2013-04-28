class Token < ActiveRecord::Base
  attr_accessible :card_id, :code, :password
  has_secure_password
  belongs_to :card
  before_create :generate_code

	private

	def generate_code
	  begin
	    self.code = SecureRandom.hex
	  end while self.class.exists?(code: code)
	end
end
