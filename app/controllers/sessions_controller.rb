class SessionsController < ApplicationController
 
   def index
   
     end
  
     def new
    @title = "Signin"
  end

  def create
     render 'new'
  end
  def profile
    @profile ="profile"
  end

  def destroy
  end

end
