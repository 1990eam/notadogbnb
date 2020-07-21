class NotdogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(owner: !user)
      end
    end
  end

  def create?
    return true
  end

  def update?
    user_owner?
  end

  def destroy?
    user_owner?
  end

  private

  def user_owner?
    record.owner == user
  end
end
