class Ticket < ActiveRecord::Base
  has_many :messages
  before_create :set_code

  def to_s
    messages.first.to_s
  end

  def set_code
    self.code = SecureRandom.hex(10)
  end

end
