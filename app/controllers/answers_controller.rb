class AnswersController < ApplicationController

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.new(:body => params[:answer][:body], :user_id => current_user)
		if @answer.save
			flash[:success] = "Answer created successfully!"
		else
			flash[:error] = "Answer could not be saved."
		end
		redirect_to classroom_question_path(params[:classroom_id], @question )
	end
end
