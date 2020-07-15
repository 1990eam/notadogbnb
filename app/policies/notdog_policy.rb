class NotdogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    user_owner?
  end

  def destroy?
    user_owner
  end

  private

  def user_owner?
    record.user == user ? true : false
  end
end
