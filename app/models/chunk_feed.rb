class ChunkFeed < ApplicationRecord
  belongs_to :user
  has_many :chunks

  def head
    chunks.max_by(&:created_at)
  end

  def tail
    _head, *tail = chunks.sort_by(&:created_at).reverse!
    tail
  end

  def sorted
    chunks.sort_by(&:created_at).reverse!
  end
end
