# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
  default :from => "Фотокросс <sunny@photocross.ru>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url  = "http://photocross.ru/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email,
         :subject => "Your password has been reset")
  end
end
