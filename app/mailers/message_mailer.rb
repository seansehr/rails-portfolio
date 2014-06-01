class MessageMailer < ActionMailer::Base
  default from: "info@seansehr.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_form_message.subject
  #
  def contact_form_message message
    @message = message

    mail(:subject => 'Contact Form', to: 'sean@seansehr.com')
  end

  def message_sent_confirmation email
    mail(:subject => 'Thank you for the message', to: email)
  end
end
