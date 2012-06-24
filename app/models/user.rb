class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :password, :email, :password_confirmation

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def avatar_url(size=48)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=retro"
  end

  def to_s
    email
  end
end
