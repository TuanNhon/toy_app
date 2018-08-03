class ApplicationMailer < ActionMailer::Base
  default from: Settings.noreply_email
  layout "mailer"
end
