class PagesController < ApplicationController
  def home
    @chunk = Chunk.new
    @chunk_feed = current_user.chunk_feed

    if current_user
      @chunking = current_user.chunks.inject(false) do |payload, chunk|
        payload || Time.now < (chunk.created_at + chunk.duration.minutes)
      end
    end

    # REMOVE -- only for quick debugging
    @chunking = false
  end
end
