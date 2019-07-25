class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find params[:room_id]
    puts "The incoming finally is #{params[:room_id]}"
    stream_for room
  end
end
