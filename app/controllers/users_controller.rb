class UsersControler < ApplicationController

  before_action :authenticate_user!

  helper_method :collection

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_params)
    if @user.save
      redirect_to @user, notice: 'ok!'
    else
      render :new
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  protected

  def collection
    @users ||= User.all
  end

  def permitted_params
    params.require(:user).permit(:email, :name)
  end

end
