class ChunksController < ApplicationController
  def new
  end

  def create
    @chunk = Chunk.new
    @chunk.user_id = current_user.id
    @chunk.title = params["title"]
    @chunk.duration = params["duration"]
    @chunk.created_at = Time.now
    @chunk.save!
    redirect_to root_path
  end
end
