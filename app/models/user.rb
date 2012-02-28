class User < ActiveRecord::Base
  attr_accessible :user_name,  :password, :password_confirm
  attr_accessor :password, :password_confirm

  validates_presence_of :user_name, :password, :password_confirm
  

end
