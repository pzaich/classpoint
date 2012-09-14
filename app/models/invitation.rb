class Invitation < ActiveRecord::Base
	include UidGenerator
  before_validation :downcase_email
	before_create :set_uid
  attr_accessible :classroom_id, :email, :uid

  belongs_to :classroom
  validates_presence_of :email

  private 
  	def downcase_email
  		self.email = email.downcase unless self.email.nil?
  	end
end
