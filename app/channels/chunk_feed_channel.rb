class ChunkFeedChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams

    chunk_feed = ChunkFeed.find current_user.chunk_feed_id
    stream_for chunk_feed
  end
end
