class IdeasController < ApplicationController

  def index
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(permitted_params)
    redirect_to @idea
  end

  def show
    @idea = Idea.find(params[:id])
  end

  protected

  def permitted_params
    params.require(:idea).permit(:title, :description, :location)
  end

end