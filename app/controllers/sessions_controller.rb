class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sesion][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # There will be code
    else
      render 'new'
    end
  end
end
