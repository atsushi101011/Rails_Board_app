class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      flash.now[:success] = t('.user_sessions_controller.create.login_success')
      redirect_to root_path
    else
      flash.now[:danger] = t('.user_sessions_controller.create.fail_login_success')
      render :new
    end
  end

  def destroy
    logout
    flash.now[:success] = t('.user_sessions_controller.destroy.logout')
    redirect_to root_path
  end
end
