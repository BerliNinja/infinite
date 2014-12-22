class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  protected

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end