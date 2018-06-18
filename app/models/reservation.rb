class Reservation < ApplicationRecord
  belongs_to :parents
  belongs_to :bbsitters

end
