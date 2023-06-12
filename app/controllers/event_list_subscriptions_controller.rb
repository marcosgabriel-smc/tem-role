class EventListSubscriptionsController < ApplicationController
  def create
    @subscription = EventListSubscription.new()
    raise
  end

  private

  def subscription_params
    params.require(:event_list_subscription).permit(:list_id)
  end
end
