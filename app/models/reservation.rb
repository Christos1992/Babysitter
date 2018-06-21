class Reservation < ApplicationRecord
  belongs_to :parent
  belongs_to :bbsitter

end
