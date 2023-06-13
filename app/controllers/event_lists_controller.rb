class EventListsController < ApplicationController
  before_action :set_event_list, only: %i[subscribe unsubscribe]
  before_action :authorize_user, only: %i[subscribe unsubscribe]

  def subscribe
    list_subscription = EventListSubscription.new
    list_subscription.user = current_user
    list_subscription.event_list = @event_list

    if list_subscription.save
      redirect_to @event_list.event
    else
      render 'events/show', status: :unprocessable_entity
    end
  end

  def unsubscribe
    list_subscription = EventListSubscription.find_by(event_list: @event_list, user: current_user)
    list_subscription.destroy
    redirect_to @event_list.event
  end

  private

  def authorize_user
    event_list = @event_list || EventList
    authorize event_list
  end

  def set_event_list
    @event_list = EventList.find(params[:list_id])
  end
end
