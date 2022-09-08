class PasswordMailer < ApplicationMailer

 def reset
    @user = params[:user]
    mail to: 'mayankkhajure@gmail.com', subject: " Password reset "
  end

end
