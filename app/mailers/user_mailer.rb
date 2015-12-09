class UserMailer < ApplicationMailer
  default from: 'juscho87@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Bienvenue sur le site de la clinique vétérinaire de Saint Junien')
  end
end
