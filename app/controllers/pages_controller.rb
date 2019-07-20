class PagesController < ApplicationController
  def home
    @chunk = Chunk.new
  end
end
