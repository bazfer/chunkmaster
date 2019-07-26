class ChunksController < ApplicationController
  before_action :load_entities

  def create
    @chunk = Chunk.create user: current_user,
                          chunk_feed: @chunk_feed,
                          title: params[:title],
                          duration: params[:duration]

    ChunkFeedChannel.broadcast_to(@chunk_feed, @chunk)
  end

  protected

  def load_entities
    @chunk_feed = ChunkFeed.find(params.dig(:chunk_feed_id))
  end
end
