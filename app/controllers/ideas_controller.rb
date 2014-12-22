class IdeasController < ApplicationController

  before_action :authenticate_user!

  helper_method :collection

  def index
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(permitted_params)

    if @idea.save
      redirect_to @idea, notice: 'ok!'
    else
      render :new
    end
  end


  def show
    @idea = Idea.find(params[:id])
  end

  protected

  def collection
    @ideas ||= Idea.all
  end

  def permitted_params
    params.require(:idea).permit(:title, :description, :location)
  end

end