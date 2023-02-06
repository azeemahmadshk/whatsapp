class UserMailer < ApplicationMailer
 default from: 'azeem.ahmadshk@gmail.com'
  def welcome_email(user_id)
    @user = User.find_by(id: user_id)
    mail(to: @user.email, subject: 'Happy Birthday to you boy')
  end
end
