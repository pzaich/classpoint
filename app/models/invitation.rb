class Invitation < ActiveRecord::Base
	before_validation :downcase_email
  attr_accessible :classroom_id, :email

  belongs_to :classroom

  validates_presence_of :email

  private 
  	def downcase_email
  		self.email = email.downcase unless self.email.nil?
  	end
end
