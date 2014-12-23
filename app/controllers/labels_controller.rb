class LabelsController < BaseController

  before_action :authenticate_user!

  helper_method :collection

  def index
    @labels = Label.order("name ASC")
  end

  def new
    @category = Category.new
  end

  def create
    @label = Label.new(permitted_params)
    if @label.save
      redirect_to @label, notice: 'ok!'
    else
      render :new
    end
  end

  protected

  def collection
    @labels ||= Label.all
  end

  def permitted_params
    params.require(:label).permit(:name)
  end

end