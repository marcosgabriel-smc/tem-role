class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[update destroy]
  before_action :authorize_user, only: %i[update destroy]

  def create
    collective = Collective.find(params[:collective_id])
    user = User.find_by(username: params[:username])

    @membership = Membership.new(collective:, user:)
    authorize @membership

    # IF/ELSE LOGIC SHOULD  BE IMPLEMENTED
    if @membership.save
      redirect_to collective, notice: "Convite enviado com sucesso!"
    else
      redirect_to collective, notice: "Não foi possível enviar o convite."
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
