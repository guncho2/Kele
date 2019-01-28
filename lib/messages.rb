require 'httparty'
require 'json'

module Messages
  include HTTParty

  BASE_URI = 'https://www.bloc.io/api/v1'


  def get_messages(page_number = 1)
    response = self.class.get("#{BASE_URI}/message_threads", headers: { "authorization" => @auth_token },
    body: {
      "page": page_number

    })

    puts "This is page #{page_number} of your messages" if response.success?

    JSON.parse(response.body)

  end

  def create_message(sender, recipient_id, token, subject, text)
    response = self.class.post("#{BASE_URI}/messages", headers: { "authorization" => @auth_token },
    body: {
      "sender" => sender,
      "recipient_id" => recipient_id,
      "token" => token,
      "subject" => subject,
      "stripped-text" => text

    })
    # puts "Your messages was sent!" if response.success?

    response

  end
end
