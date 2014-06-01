class Message
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates_presence_of :name
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_length_of :message, :maximum => 500

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def send_message
    # Only proceed if the message is valid
    return false if !self.valid?
    # send message here
    puts MessageMailer
    email = MessageMailer.contact_form_message(self).deliver
    if(email)
      email
    else
      flash[:notice] = "Something went wrong, please try again. If problems persist please contact me at sean@seansehr.com"
    end
  end
end
