class ChunkChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts 'success'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
