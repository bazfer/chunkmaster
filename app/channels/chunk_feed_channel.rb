class ChunkFeedChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams

    feed_id = params[:chunk_feed_id] ||= current_user.chunk_feed.id
    chunk_feed = ChunkFeed.find feed_id

    stream_for chunk_feed
  end
end
