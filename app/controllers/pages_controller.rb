class PagesController < ApplicationController
  def home
    @chunk_feed = current_user.chunk_feed if current_user
    @chunk = Chunk.new
  end
end
