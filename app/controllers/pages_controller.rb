require 'json'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @address = Address.new
  end

  def zip_code_finder
    find_address(address_params)
    raise
  end


  private

  def find_address(zip_code)
    url = "https://h-apigateway.conectagov.estaleiro.serpro.gov.br/api-cep/v1/consulta/cep/#{zip_code}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
  end

  def address_params
    params.require(:address).permit(:address, :zip_code)
  end

end
