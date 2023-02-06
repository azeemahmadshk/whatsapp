class RoomChannel < ApplicationCable::Channel
 
  def subscribed
    #stream_from "room_channel_#{params[:room_id]}"
    stream_from "room_channel_test"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
