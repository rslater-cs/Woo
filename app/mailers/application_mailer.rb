class ApplicationMailer < ActionMailer::Base
  default to: 'info@mynotes.com', from: 'from@example.com'
  layout 'mailer'
end
