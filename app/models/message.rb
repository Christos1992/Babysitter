class Message < ApplicationRecord
  belongs_to :reservation
  validates :content, length: { minimum: 5 }
end
