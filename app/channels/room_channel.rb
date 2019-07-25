class RoomChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams

    return if params[:room_id].nil?

    room = Room.find params[:room_id]
    stream_for room
  end
end
