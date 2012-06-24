class TicketMailer < ActionMailer::Base
  default from: "support@annoying.ly"

  def notify_employee(message, employee)
    @message = message
    mail to: employee.email, subject: message.subject
  end
end
