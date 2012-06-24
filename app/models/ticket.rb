class Ticket < ActiveRecord::Base
  has_many :messages

  def to_s
    messages.first.to_s
  end
end
