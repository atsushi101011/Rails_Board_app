class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = t('.users_controller.create.signup_success')
      redirect_to login_path
    else
      flash.now[:danger] = t('.users_controller.create.fail_signup_success')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
