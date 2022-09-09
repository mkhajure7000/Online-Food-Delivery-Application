class TaskLoggerJob < ApplicationJob
  queue_as :default

  def perform
    puts "TaskLoggerJob is performed"
  end
end
