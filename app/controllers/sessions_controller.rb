class SessionsController < ApplicationController
  
 def new
    @title = "Signin"
    
  end
  def Profile
  end

  def create
    user = User.authenticate(params[:session][:email],params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = 'Sign in'
      render 'profile'
    else
      signin user
      redirect_to user
    end
  end

  def destroy
    signout_path
    redirect_to root_path
  end
end
