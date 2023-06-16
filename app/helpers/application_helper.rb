module ApplicationHelper
  def any_collectives_with_events(collectives)
    collectives.map { |collective| collective.next_events.any? }.any?
  end
end
