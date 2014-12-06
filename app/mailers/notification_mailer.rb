class NotificationMailer < ActionMailer::Base
  default from: "no-reply@galleratiapp.com"

  def comment_added
  	mail(to: "erin.e.kim@gmail.com", 
  		subject: "A comment has been added to your place!")
  end
end
