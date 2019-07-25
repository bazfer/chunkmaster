class ChunksController < ApplicationController
  before_action :load_entities

  def create
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
