class Reservation < ApplicationRecord
  belongs_to :parent
  belongs_to :bbsitter
  has_many :messages
end
