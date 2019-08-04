class PagesController < ApplicationController
  def home
    @chunk_feed = current_user.chunk_feed
    @chunk = Chunk.new
  end
end
