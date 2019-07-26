class ChunkFeed < ApplicationRecord
  belongs_to :user
  has_many :chunks
end
