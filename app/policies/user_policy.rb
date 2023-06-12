class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    record == user
  end

  def destroy?
    false
  end
end
