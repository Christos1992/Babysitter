class PagesController < ApplicationController

  #skip_before_action :authenticate_user! , only: [:home]
  #skip_before_action :check_profile , only: [:home]
  def home

  end

  def index
    @city = params[:city]
    @bbsitters = Bbsitter.where(city: params[:city])
  end

  def show
    @bbsitters = Bbsitter.where(city: "Athens")
  end



end
