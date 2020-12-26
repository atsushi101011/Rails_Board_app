class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    redirect_to login_path, danger: 'ログインしてください'
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
