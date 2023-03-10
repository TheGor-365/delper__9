class QuestionsController < ApplicationController
  before_action :authenticate_account!, only: [:create]

  def index
    @technology = Technology.find(params[:technology_id])
    @technologies = Technology.all
    @questions = @technology.questions.all
  end

  def show
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @questions = @technology.questions.all
    @question = Question.find(params[:id])
  end

  def new
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
  end

  def create
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @technology.questions.create(question_params)

    redirect_to technology_questions_path(@technology)
  end

  def edit
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @questions = @technology.questions.all
    @question = Question.find(params[:id])
  end

  def update
    @technology = Technology.find(params[:technology_id])
    @questions = @technology.questions.all

    if @technology.questions.update(question_params)
      redirect_to technology_questions_path(@technology)
    else
      render action: 'edit'
    end
  end

  def destroy
    @technology = Technology.find(params[:technology_id])
    @questions = @technology.questions
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to technology_questions_path
  end

  private
  def question_params
    params.require(:question).permit(:question, :snippet)
  end
end
