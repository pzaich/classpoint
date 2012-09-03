class InvitationMailer < ActionMailer::Base
  default from: "invitations@classpoint.io"

  def invite(invitation, classroom)
  	@invitation = invitation
  	@classroom = classroom
  	mail(:to => @invitation.email, :subject => "You have been invited to #{@classroom.name}")
  end
end
