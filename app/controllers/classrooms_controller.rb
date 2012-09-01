class ClassroomsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@classrooms = current_user.classrooms.all
	end

	def new
		@classroom = Classroom.new
	end

	def create
		@classroom = current_user.classrooms.new(params[:classroom])
		if @classroom.save
			redirect_to classrooms_path, :flash => {:success => "Classroom #{@classroom.name} successfully created."}
		else
			render 'new', :flash => {:error => "Oops, something went wrong."}
		end
	end

end
