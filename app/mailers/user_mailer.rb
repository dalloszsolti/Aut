class UserMailer < ActionMailer::Base
  default from: "fenyvesekkozt@gmail.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Jelszó megújítása"
  end
end
