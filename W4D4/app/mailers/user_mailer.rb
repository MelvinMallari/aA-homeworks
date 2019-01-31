class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    # your code here
    @user = user
    # @url  = 'http://example.com/login'
    mail(to: "test@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end

