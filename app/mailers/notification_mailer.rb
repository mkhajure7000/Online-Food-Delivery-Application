class NotificationMailer < ApplicationMailer

  def create_notification(object)
    @object = object
    @object_count = object.class.count
    mail to: 'mayankkhajure@gmail.com', subject: "A new entry for #{object.class} has benn created"
  end

end
