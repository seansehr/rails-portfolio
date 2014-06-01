class MessagesController < ApplicationController

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    MailerWorker.perform_async(message_params)
    flash[:notice] = "Message sent! Thank you for contacting us."
    redirect_to root_url
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:name, :email, :message)
    end
end
