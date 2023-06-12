class MembershipPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    record.collective.owner == user
  end

  def edit?
    update?
  end

  def update?
    record.collective.owner == user || record.user == user
  end

  def destroy?
    record.collective.owner == user || record.user == user
  end
end
