class ClassroomsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@classrooms = current_user.owned_classrooms
	end

	def new
		@classroom = Classroom.new
	end

	def create
		@classroom = current_user.owned_classrooms.new(params[:classroom])
		if @classroom.save
			redirect_to classrooms_path, :flash => {:success => "Classroom #{@classroom.name} successfully created."}
		else
			render 'new', :error => "Oops, something went wrong."
		end
	end

end
