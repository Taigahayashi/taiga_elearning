class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:info] = "Succesflly logged in."
      redirect_to root_url
    else
      render 'new'
      flash[:danger] = "Invaild Credentions"
    end
  end
  
  def destroy
    log_out
    flash[:info] = "Successflly logged out"
    redirect_to root_url
  end
end
