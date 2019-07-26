class ChunksController < ApplicationController
  before_action :load_entities

  def create
    @chunk = Chunk.create user: current_user,
                          chunk_feed_id: @chunk_feed_id,
                          title: params[:title],
                          duration: params[:duration]
    binding.pry
    ChunkFeedChannel.broadcast_to(@chunk_feed, @chunk)
  end

  protected

  def load_entities
    @chunk_feed_id = ChunkFeed.find(params.dig(:chunk_feed_id)).id
  end
end
