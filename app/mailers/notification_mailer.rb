class NotificationMailer < ApplicationMailer

  def create_notification(user)
    @user = user
    mail to: @user.email, subject: "Account Created"
  end

end
