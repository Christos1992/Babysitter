class ParentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
    def create?
    return true
  end

  def update?
    record.user == user

  def show
    true
  end

  end

  def destroy?
    record.user == user
  end
end
