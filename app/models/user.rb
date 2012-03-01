class User < ActiveRecord::Base
  attr_accessible :user_name,  :password, :password_confirm
  attr_accessor :password, :password_confirm
 
  before_save :setup
  validates_presence_of :user_name, :password, :password_confirm

  ROLES ={:super => "super", :admin => "admin", :store =>"store", :buyer =>"buyer"}

  def setup
    #setup password hash
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_user_name(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def check_super_admin
    logger.info "*** in" 
     if !User.where(:role => ROLES[:super]).first
       logger.info "*** in 2" 
       user = User.new
       user.user_name = "super"
       user.password = "super"
       user.password_confirm = "super"
       user.role = ROLES[:super]
       user.save
       logger.info "*** in 3" 
     end
  end
end