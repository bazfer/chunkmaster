class ChunkChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    user = current_user
    chunk = user.chunks.last
    stream_for chunk
  end

  def receive(data)
    p 'received'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
