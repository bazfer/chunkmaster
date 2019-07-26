class ChunksController < ApplicationController
  before_action :load_entities

  def show
  end

  def create
    ChunkChannel.broadcast_to(@chunk, {})
  end

  protected

  def load_entities
    @chunk = Chunk.create(permitted_parameters)
  end

  def permitted_parameters
    params[:user_id] = current_user.id
    params.except(:authenticity_token, :commit).permit(:user_id, :title, :duration)
  end
end
