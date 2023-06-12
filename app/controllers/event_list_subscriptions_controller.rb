class EventListSubscriptionsController < ApplicationController
  def create
    @subscription = EventListSubscription.create!(
      event_list_id: params["list_id"],
      user: current_user
    )
    redirect_to "/events/#{params['event_id']}"
  end

  ### ENTENDER O MOTIVO PELO QUAL NÃO PRECISA FAZER O PERMIT
  # private

  def subscription_params
    params.require(:event_list_subscription).permit(:list_id, :user_id)
  end
end
