class UserMailer < ApplicationMailer
  default from: 'notifications@Odinbook.com'
 
  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to Odinbook')
  end
end