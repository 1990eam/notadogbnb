class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: @user)
    end
  end

  def new?
    user.admin || record.notdog.owner != user
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user_id == user.id
  end

  def accept?
    record.notdog.owner == user
  end

  def decline?
    record.notdog.owner == user
  end
end
