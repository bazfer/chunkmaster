class ChunksController < ApplicationController
  def new
    @chunk = Chunk.new
  end

  def create
    @chunk = Chunk.create(chunk_params)
    redirect_to root_path
  end

  private

  def chunk_params
    params[:user_id] = current_user.id
    params.except(:authenticity_token, :commit).permit(:user_id, :title, :duration)
  end
end
