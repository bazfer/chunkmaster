class Chunk < ApplicationRecord
  validates :title, presence: true
  validates :duration, presence: true, numericality: { only_integer: true }

  belongs_to :user, optional: true, inverse_of: :chunks
  belongs_to :chunk_feed, optional: true, inverse_of: :chunks

  def completed?
    Time.now > (created_at + duration.minutes)
  end

  def seconds_to_completion
    ((created_at + duration.minutes) - Time.now) / 3600
  end
end
