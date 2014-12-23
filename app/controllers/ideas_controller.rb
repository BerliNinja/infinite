class IdeasController < ApplicationController

  before_action :authenticate_user!

  helper_method :collection, :resource

  def index
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_creation_params)
    if @idea.save
      redirect_to @idea,
      notice: 'Everything worked!'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  protected

  def resource
    @idea ||= Idea.find(params[:id])
  end

  def idea_creation_params
    permitted_params.merge({
      category_id: params.fetch(:idea, {})[:category],
      user_id: current_user.id,
      label_id: params.fetch(:idea, {})[:label]
    })
  end

  def collection
    @ideas ||= Idea.all
  end

  def permitted_params
    params.require(:idea).permit(:title, :description, :location)
  end

end