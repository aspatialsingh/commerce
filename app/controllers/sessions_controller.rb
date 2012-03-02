class SessionsController < ApplicationController
  def index
   
  end
   
 def new
    @title = "Signin"
    
  end
 def profile
   @profile = "profile"
 end

  def create
    render "new"
  end

  def destroy
 end    
end
