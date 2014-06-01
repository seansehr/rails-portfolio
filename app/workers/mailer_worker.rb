class MailerWorker
  include Sidekiq::Worker

  def perform(message_params)
    @message = Message.new(message_params)
    @message.send_message
  end
end
