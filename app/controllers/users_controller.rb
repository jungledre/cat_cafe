class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      render :new
    else
      flash[:success] = 'User has been created. You can now log in.'
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:password, :password_confirmation)
  end
end
