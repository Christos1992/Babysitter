class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_parent?
        scope.where(parent_id: user.parent)
      else
        scope.where(bbsitter_id: user.bbsitter)

      end
    end
  end



  def new
    true
  end

  def show?
    true
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
