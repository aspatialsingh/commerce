class Store < ActiveRecord::Base
  attr_accessible :name, :suspended, :deleted, :user_id
  belongs_to :user

end
