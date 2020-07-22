class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    notdog = Notdog.find_by(id: record.notdog_id)
    notdog.owner == user
  end

  def destroy?
    record.user == user
  end
end
