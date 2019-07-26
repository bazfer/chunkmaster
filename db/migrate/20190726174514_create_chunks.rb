class CreateChunks < ActiveRecord::Migration[6.0]
  def change
    create_table :chunks do |t|
      t.belongs_to :user, index: true

      t.string :title, required: true
    end
  end
end
