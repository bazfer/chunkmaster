class PagesController < ApplicationController
  def home
    @chunk = Chunk.new

    if current_user
      @chunking = current_user.chunks.inject(false) do |payload, chunk|
        payload || Time.now < (chunk.created_at + chunk.duration.minutes)
      end
    end
  end
end
