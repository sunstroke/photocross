# -*- encoding : utf-8 -*-
class Notifier < ActionMailer::Base
  default :from => "Фотокросс <no-reply@photocross.ru>"  
  def password_reset_instructions(user)
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)           
    mail(:to=>user.email, :subject=>"Смена пароля",:date=>Time.now)    
  end
  
  def team_invitation(team_user)
    @team_user = team_user
    @user = team_user.user
    mail(:subject=>"Приглашение в команду",:to=>team_user.user.email, :date=>Time.now)
    
  end
end
