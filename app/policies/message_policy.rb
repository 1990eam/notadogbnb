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

  # El update funciona para "respoder" una pregunta, por lo que solo el dueño puede
  def update?
    notdog = Notdog.find_by(id: record.notdog_id)
    notdog.owner == user
  end

  # Solo el usuario que hizo la pregunta o el dueño del Notdog pueden eliminarla
  def destroy?
    notdog = Notdog.find_by(id: record.notdog_id)
    record.user == user || notdog.owner == user
  end
end
