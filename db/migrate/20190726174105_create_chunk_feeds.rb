class CreateChunkFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :chunk_feeds do |t|
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
