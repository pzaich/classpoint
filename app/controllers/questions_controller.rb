class QuestionsController < ApplicationController
  before_filter :find_question, :only => [:show, :edit]
  before_filter :find_classroom, :only => [:new, :create, :update, :edit]

  def new
  	@question = Question.new
  end

  def create  
    @question = Question.new(params[:question].merge({:user_id => current_user, :classroom_id => @classroom}))
    if @question.save
      redirect_to classroom_path(@classroom), :flash => { :success => "Question has been added." }
    else
      flash[:error] = "Oops, something went wrong."
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update

  end

  private
  	def find_question
  		@question = Question.find(params[:id])
  	end

    def find_classroom
      @classroom = Classroom.find_by_uid(params[:classroom_id])
    end
end
