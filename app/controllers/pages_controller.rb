class PagesController < ApplicationController
  def home
    @chunk = Chunk.new
    @chunk_feed = current_user.chunk_feed
  end
end
