class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_user, only: %i[show]
  before_action :authorize_user, only: %i[show]

  def index
    @users = policy_scope(User)
  end

  def show
    @membership = Membership.new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    user = @user || User
    authorize user
  end
end
