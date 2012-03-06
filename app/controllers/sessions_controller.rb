class SessionsController < ApplicationController
  def new
    if request.post?
      logger.debug "* sign in post"
      user = User.authenticate(params[:session][:email],params[:session][:password])
      logger.debug user.inspect
      if user.blank?
        flash.now[:error] = "Invalid email/password combination."
      else
        if user.role == User::ROLES[:store]
          redirect_to super_stores_path
        elsif  user.role == User::ROLES[:super]
          #TODO:redirect to super dashboard
        else
          redirect_to profile_path
        end
      end
    end
  end

  def signout
    signout_path
    redirect_to root_path
  end
end
