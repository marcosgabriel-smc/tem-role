class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[show update destroy]
  before_action :authorize_user, only: %i[create update destroy]

  def show
  end

  def create
    @membership = Membership.new(membership_params)
    collective = Collective.find(params[:collective_id])
    @membership.collective = collective
    if @membership.save
      redirect_to collective
    else
      render 'collective/show', status: :unprocessable_entity
    end
  end

  def update
    # TODO: update with AJAX
    if @membership.update(accepted: params[:accepted])
      redirect_to user_path(current_user)
    else
      render 'users/show', status: :unprocessable_entity
    end
  end

  def destroy
    # TODO: destroy with AJAX
    @membership.destroy
    redirect_to user_path(current_user)
  end

  private

  def authorize_user
    membership = @membership || Membership
    authorize membership
  end

  def set_membership
    @membership = Membership.find(params[:id])
  end

  def membership_params
    params.require(:membership).permit(:collective, :user, :accepted, :dj)
  end
end
