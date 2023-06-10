class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home teste]

  def home
  end

  def teste
    @events = Event.all
  end
end
