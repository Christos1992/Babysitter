class Conversation < ApplicationRecord
belongs_to :parent, :foreign_key => :parent_id, class_name: 'User'
belongs_to :bbsitter, :foreign_key => :bbsitter_id, class_name: 'User'
has_many :messages, dependent: :destroy



  scope :between, -> (parent_id,bbsitter_id) do
    where("(conversations.parent_id = ? AND conversations.bbsitter_id =?) OR (conversations.parent_id = ? AND conversations.bbsitter_id =?)", parent_id,bbsitter_id, bbsitter_id, parent_id)
  end

end
