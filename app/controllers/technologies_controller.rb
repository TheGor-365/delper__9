class TechnologiesController < ApplicationController
  before_action :authenticate_account!, only: [:new, :create]

  def index
    @technologies = Technology.all

  end

  def show
    @technologies = Technology.all
    @technology = Technology.find(params[:id])
  end

  def new
    @technologies = Technology.all
    @author = current_account.username

  end

  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      redirect_to @technology
    else
      render action: 'new'
    end
  end

  def edit
    @technologies = Technology.all
    @technology = Technology.find(params[:id])
  end

  def update
    @technology = Technology.find(params[:id])

    if @technology.update(technology_params)
      redirect_to @technology
    else
      render action: 'edit'
    end
  end

  def destroy
    @technology = Technology.find(params[:id])
    @technology.destroy

    redirect_to technologies_path
  end

  private
  def technology_params
    params.require(:technology).permit(
      :title,
      :purpose,
      :description,
      :doc
    )
  end
end
