class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :parent,  dependent: :destroy
  has_one :bbsitter, dependent: :destroy
  has_many :reservations
  def render_what_i_am
     if self.is_parent
        Parent.create!( user: self ) if self.parent.nil?
        return self.parent
     else
       Bbsitter.create!(user: self)  if self.bbsitter.nil?
       return self.bbsitter
     end
  end
end
