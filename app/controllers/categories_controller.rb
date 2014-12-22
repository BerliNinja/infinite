class CategoriesController < ApplicationController

  before_action :authenticate_user!

  helper_method :collection

  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(permitted_params)
    if @category.save
      redirect_to @category, notice: 'ok!'
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  protected

  def collection
    @categories ||= Category.all
  end

  def permitted_params
    params.require(:category).permit(:title, :image)
  end

end