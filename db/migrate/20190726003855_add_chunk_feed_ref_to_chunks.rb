class AddChunkFeedRefToChunks < ActiveRecord::Migration[6.0]
  def change
    add_reference :chunks, :chunk_feed, foreign_key: true
  end
end
