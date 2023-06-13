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

  def create
    @event = Event.find(params[:event_id])
    @event_list = EventList.new(event_list_params)
    @event_list.event = @event
    if @event_list.save
      redirect_to @event, notice: "List was successfully created."
    else
      render @event, status: :unprocessable_entity
    end
  end

  private

  def authorize_user
    event_list = @event_list || EventList
    authorize event_list
  end

  def set_event_list
    @event_list = EventList.find(params[:list_id])
  end

  def event_list_params
    params.require(:event_list).permit(:name, :requirement)
  end

end
