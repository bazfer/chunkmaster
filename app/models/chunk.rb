class Chunk < ApplicationRecord
  validates :title, presence: true
  validates :duration, presence: true, numericality: { only_integer: true }

  belongs_to :user, optional: true, inverse_of: :chunks
  belongs_to :chunk_feed, index: true
end
