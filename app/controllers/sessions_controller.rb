class SessionsController < ApplicationController
  
   def new
    @title = "Signin"
  end

  def create
     render 'new'
  end

  def destroy
  end
end
