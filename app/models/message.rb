class Message < ActiveRecord::Base
  attr_accessible :from, :html, :plain, :subject

  belongs_to :ticket

  validates :from, presence: true
  validates :subject, presence: true
  validates :plain, presence: true

  before_create :create_ticket
  after_create :notify_employee

  def to_s
    subject
  end

  private

  def create_ticket
    self.ticket = Ticket.new
  end

  def notify_employee
    TicketMailer.notify_employee(self, User.random)
  end
end
