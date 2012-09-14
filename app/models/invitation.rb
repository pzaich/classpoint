class Invitation < ActiveRecord::Base
	before_validation :downcase_email
	before_create :set_uid
  attr_accessible :classroom_id, :email, :uid

  belongs_to :classroom
  validates_presence_of :email

  private 
  	def downcase_email
  		self.email = email.downcase unless self.email.nil?
  	end

  	def set_uid
      self.uid = SecureRandom.uuid
	  end
end
