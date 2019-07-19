class CreateChunks < ActiveRecord::Migration[6.0]
  def change
    create_table :chunks do |t|
      t.belongs_to :user, index: true

      t.string :title
      t.integer :duration
      t.timestamp :completed_at
      t.timestamp :cancelled_at

      t.timestamps
    end
  end
end
