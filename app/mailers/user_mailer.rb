class UserMailer < ApplicationMailer
  def account_activation
    @greeting = t ".hi"
    mail to: Settings.example_email
  end
  
  def password_reset
    @greeting = t ".hi"
    mail to: Settings.example_email
  end
end
