class UsersController < ApplicationController
  before_action :logged_in_user

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end
