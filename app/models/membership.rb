class Membership < ActiveRecord::Base
	attr_accessible :user_id, :classroom_id, :invite_uid
	belongs_to :member, :class_name => "User", :foreign_key => "user_id"
	belongs_to :classroom
	validates_presence_of :member, :classroom, :invite_uid
	validates_uniqueness_of :user_id, :scope => :classroom_id
	validate :has_a_matching_invitation?

	def has_a_matching_invitation?
		if Classroom.exists?(self.classroom_id)
			if Classroom.find(self.classroom_id).invitations.all.select { |invite| invite.uid == self.invite_uid }.empty?
				errors.add(:invitation_missing, "Can't find an invitation for this classroom.")
			end
		end
	end
end
