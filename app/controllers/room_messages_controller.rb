class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:message)
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_id)
  end
end
