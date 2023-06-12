class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :authorize_user, only: %i[show]

  def show
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
