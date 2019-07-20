class Chunk < ApplicationRecord
  validates :title, presence: true
  validates :duration, presence: true, numericality: { only_integer: true }

  belongs_to :user, optional: true
end
