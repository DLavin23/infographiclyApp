class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def digest_email(user)
    @user = user
    @url  = "http://localhost:3000/login"
    mail(:to => user.email, :subject => "Your 5 Most Recent Articles")
  end
end
