class TaskLoggerJob < ApplicationJob
  queue_as :default

  def perform(user)
    NotificationMailer.create_notification(@user).deliver
  end

end
