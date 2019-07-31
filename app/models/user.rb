class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :chunk_feed
  has_many :chunks, inverse_of: :user
  has_many :room_messages

  # gotta convert this to a SQL query at some point
  # also, this will not scale
  # gotta write some stress tests
  def chunking?
    chunks.inject(false) do |status, chunk|
      status || Time.now < (chunk.created_at + chunk.duration.minutes)
    end
  end
end
