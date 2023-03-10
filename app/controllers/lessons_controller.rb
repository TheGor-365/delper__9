class LessonsController < ApplicationController
  before_action :authenticate_customer!, only: [:create]

  def index
    @technology = Technology.find(params[:technology_id])
    @technologies = Technology.all
    @lessons = @technology.lessons.all
  end

  def show
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @lessons = @technology.lessons.all
    @lesson = Lesson.find(params[:id])
  end

  def new
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
  end

  def create
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @technology.lessons.create(lesson_params)

    redirect_to technology_lessons_path(@technology)
  end

  def edit
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @lessons = @technology.lessons.all
    @lesson = Lesson.find(params[:id])
  end

  def update
    @technology = Technology.find(params[:technology_id])
    @lessons = @technology.lessons.all

    if @technology.lessons.update(lesson_params)
      redirect_to technology_lessons_path(@technology)
    else
      render action: 'edit'
    end
  end

  def destroy
    @technology = Technology.find(params[:technology_id])
    @lessons = @technology.lessons
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    redirect_to technology_lessons_path
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :body)
  end
end
