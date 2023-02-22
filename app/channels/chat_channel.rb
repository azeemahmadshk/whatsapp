class ChatChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  #rescue_from 'MyError', with: :deliver_error_message
  
  def subscribed
    #stream_for "chat"
    stream_from "chat_#{$id}"
  end

end
