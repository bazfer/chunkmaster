class CompleteChunkJob < ApplicationJob
  queue_as :default

  def perform(chunk)
    chunk.completed_at = DateTime.now
    chunk.save
    # ChunkFeedChannel.broadcast_to(feed, chunk)
    puts "CHUNK #{chunk.title} HAS BEEN COMPLETED"
  end
end
