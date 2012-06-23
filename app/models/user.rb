class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :password, :email, :password_confirmation

  validate :email, presence: true, uniqueness: true
  validates_presence_of :password, :on => :create

end
