class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chunks, inverse_of: :user
  has_many :room_messages
  has_one :chunk_feed, inverse_of: :user
end
