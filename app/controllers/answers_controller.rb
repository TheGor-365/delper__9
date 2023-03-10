class AnswersController < ApplicationController
  before_action :authenticate_account!, only: [:create]

  def index
    @technology = Technology.find(params[:technology_id])
    @technologies = Technology.all
    @questions = @technology.questions.all
    @answers = @technology.questions.find(params[:question_id]).answers.all
  end

  def show
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @questions = Question.all
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def new
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @questions = Question.all
    @question = Question.find(params[:question_id])

  end

  def create
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @question = Question.find(params[:question_id])
    @technology.questions.find(params[:question_id]).answers.create(answer_params)


    redirect_to technology_question_answers_path(@technology, @question)
  end

  def edit
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @questions = @technology.questions.all
    @question = Question.find(params[:question_id])
    @answers = @technology.questions.find(params[:question_id]).answers.all
    @answer = @technology.questions.find(params[:question_id]).answers.find(params[:id])
  end

  def update
    @technology = Technology.find(params[:technology_id])
    @answers = @technology.questions.all
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

    if @technology.questions.find(params[:question_id]).answers.find(params[:id]).update(answer_params)
      redirect_to technology_question_answers_path(@technology, @question)
    else
      render action: 'edit'
    end
  end

  def destroy
    @technology = Technology.find(params[:technology_id])
    @questions = @technology.questions
    @answer = @technology.questions.find(params[:question_id]).answers.find(params[:id])
    @answer.destroy

    redirect_to technology_question_answers_path
  end

  private
  def answer_params
    params.require(:answer).permit(:shortcut, :snippet, :explain)
  end
end
