class DropChunks < ActiveRecord::Migration[6.0]
  def change
    drop_table :chunks
  end
end
