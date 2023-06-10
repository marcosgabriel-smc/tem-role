class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home teste]

  def home
  end

  def my_profile
    @events = Event.all
    @collectives = Collective.all
  end

  def teste
  end
end
