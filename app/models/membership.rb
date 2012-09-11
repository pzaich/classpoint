class Membership < ActiveRecord::Base
	attr_accessible :user_id, :classroom_id, :invite_uid
	belongs_to :user
	belongs_to :classroom
	validates_presence_of :user, :classroom, :invite_uid
	validates_uniqueness_of :user_id, :scope => :classroom_id
	validate :has_a_matching_invitation

	def has_a_matching_invitation
		if Classroom.find(self.classroom_id).invitations.all.select { |invite| invite.uid == self.invite_uid }.empty?
			errors.add(:invitation_missing, "Can't find an invitation for this classroom.")
		end
	end
end
