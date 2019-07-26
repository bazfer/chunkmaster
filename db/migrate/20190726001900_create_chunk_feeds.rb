class CreateChunkFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :chunk_feeds do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :chunk_feeds, :id, unique: true
  end
end
