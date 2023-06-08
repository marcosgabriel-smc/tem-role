class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    !user&.collectives&.empty?
  end

  def edit?
    update?
  end

  def update?
    record.collective.owner == user
  end

  def destroy?
    record.collective.owner == user
  end
end
