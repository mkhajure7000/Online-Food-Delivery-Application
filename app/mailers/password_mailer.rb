class PasswordMailer < ApplicationMailer

  def reset
    @user = params[:user]
    mail to: @user.email, subject: " Password reset "
  end

end
