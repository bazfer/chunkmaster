class CreateChunks < ActiveRecord::Migration[6.0]
  def change
    create_table :chunks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chunk_feed, null: false, foreign_key: true

      t.string :title
      t.integer :duration
      t.timestamp :completed_at
      t.timestamp :cancelled_at

      t.timestamps
    end
  end
end
