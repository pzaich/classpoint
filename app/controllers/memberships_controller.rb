class MembershipsController < ApplicationController
	before_filter :authenticate_user!
	after_filter :dump_sessions, :only => [:create]
	def new
		@classroom = Classroom.find_by_uid(params[:classroom_id])
		@membership = Membership.new()
	end

	def create
		@classroom = Classroom.find_by_uid(params[:classroom_id])
		@membership = Membership.new(:classroom_id => @classroom.id, :user_id => current_user.id, :invite_uid => session[:invite_uid])
		if @membership.save
			redirect_to classroom_path(params[:classroom_id]), :flash => { :success => "Classroom successfully joined!"}
		else
			render 'new', :flash => {:error => "You were not able to join the classroom."}
		end
	end

	private
		def dump_sessions
			session.delete(:classroom_uid)
			session.delete(:invite_uid)
 		end
	
end
