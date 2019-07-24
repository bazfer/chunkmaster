class ChunkChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    user = current_user
    chunk = user.chunks.last
    binding.pry
    stream_for chunk
  end

  def receive(data)
    p 'received'
  end

  def unsubscribed
    stop_all_streams
  end
end
