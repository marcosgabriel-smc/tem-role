events_by_city = @events.group_by { |event| event[:city] }

cards_by_city = events_by_city.transform_values do |events|
  events.map do |event|
    render partial: 'event_card', formats: :html, locals: { event: }
  end
end

json.content(cards_by_city)
