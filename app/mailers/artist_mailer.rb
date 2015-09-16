class ArtistMailer < ActionMailer::Base
  default from: "afriqart18@gmail.com"

  def sign_up_artist(user)
    @user=user
    @url="www.afriqart18.com/login"
    mail(to: @user.email, subject: "Welcome to afriqART")
  end
end
