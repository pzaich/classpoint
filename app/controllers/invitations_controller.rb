class InvitationsController < ApplicationController
	def new
		@classroom = Classroom.find(params[:classroom_id])
		@invitation = Invitation.new
	end

	def create
		invitation = Invitation.new(params[:invitation])
		classroom = Classroom.find_by_id(invitation.classroom_id)
		if classroom.retrieve_member(invitation.email).nil?
			if invitation.save
				InvitationMailer.invite(invitation, classroom).deliver
				redirect_to new_classroom_invitation_path(classroom), :flash => {:success => "Invitation for #{invitation.email} send successfully."}
			end
		else
			flash[:error] => "Could not create invitation."
			render new_classroom_invitation_path(classroom)
		end
	end
end
