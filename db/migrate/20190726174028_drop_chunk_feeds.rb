class DropChunkFeeds < ActiveRecord::Migration[6.0]
  def change
    drop_table :chunk_feeds
  end
end
