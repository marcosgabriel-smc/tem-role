class EventListPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def subscribe?
    user&.present?
  end

  def unsubscribe?
    subscribe?
  end
end
