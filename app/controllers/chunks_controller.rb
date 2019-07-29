class ChunksController < ApplicationController
  before_action :load_entities

  def create
    @chunk = Chunk.create user: current_user,
                          chunk_feed: @chunk_feed,
                          title: params[:title],
                          duration: params[:duration]
    @chunk.save

    ChunkFeedChannel.broadcast_to(@chunk_feed, @chunk)
    # binding.pry
    # if @chunk
    #   duration = params[:duration].to_i
    #   CompleteChunkJob.set(wait: duration.minutes).perform_later(@chunk)
    # end
  end

  protected

  def load_entities
    @chunk_feed = ChunkFeed.find(params.dig(:chunk_feed_id))
  end
end
