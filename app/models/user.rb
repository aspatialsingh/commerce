class User < ActiveRecord::Base
  attr_accessible :user_name,  :password, :password_confirm
  attr_accessor :password, :password_confirm

  attr_accessor password

  belongs_to :mailing_address, :foreign_key => "mailing_address_id", :class_name => "Address"

  has_many rders
  has_many ayment_profiles
  has_many :auto_recharges

  before_save setup
   validates_presence_of :user_name, :password, :password_confirm

  def setup
    #setup password hash
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
    #setup path and level
    if self.sponser.present?
      sponser = User.where(:user_name => self.sponser).first
      self.root = sponser.root.present? ? sponser.root : sponser.id
      self.parent = sponser.id
      self.level = sponser.level + 1
    else
      self.level = 0
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

  def name
    first_name+ " " +last_name
  end
end