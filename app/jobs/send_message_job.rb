class SendMessageJob < ApplicationJob
# include Sidekiq::Worker
 # sidekiq_options_hash queue: "default"
queue_as :default
  def perform(message_id)
    @message= Message.find_by(id: message_id)
    #ActionCable.server.broadcast "room_channel_#{@message.room_id}", message: @message
    #ActionCable.server.broadcast "room_channel"
    #ActionCable.server.broadcast("room_channel_test", { body: "This Room is Best Room." })
    #ActionCable.server.broadcast("Best Room", { body: "This Room is Best Room." })
    #ActionCable.server.broadcast("chat", { body: "This Room is Best Room." })
    #ActionCable.server.broadcast "ChatChannel"
    ChatChannel.broadcast_to("ChatChannel", { body: "This Room is Best Room." }) 
  end
end