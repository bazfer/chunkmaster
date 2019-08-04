class ChunkFeedsController < ApplicationController
  before_action :load_entities

  def index
    @chunk_feed
  end

  def show
    @chunk = Chunk.new(chunk_feed: @chunk_feed)
    @chunks = @chunk_feed.chunks.includes(:user)
    respond_to do |format|
      format.html
      format.json { render json: @chunk_feed }
    end
  end

  def update
  end

  protected

  def load_entities
    @chunk_feed = ChunkFeed.find_by(user: current_user)
  end
end
