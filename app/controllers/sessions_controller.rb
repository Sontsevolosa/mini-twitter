class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sesion][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to current_user
    else
      render 'new'
    end
  end
end
