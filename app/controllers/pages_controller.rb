class PagesController < ApplicationController

  #skip_before_action :authenticate_user! , only: [:home]
  #skip_before_action :check_profile , only: [:home]
  def home

  end

  def index
    if @city = params[:city]
    @bbsitters = Bbsitter.where(city: params[:city])
     elsif params[:query].present?
      # Now we are searching in two columns of the Movies table; title + syllabus
      # sql_query = "movies.title @@ :query OR movies.syllabus @@ :query OR directors.first_name @@ :query OR directors.last_name @@ :query"
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
      @bbsitters = @bbsitters.search_by_first_name_and_experience (params[:query])
    else
      @bbsitters = nil
    end

  end

  def show
    @bbsitters = Bbsitter.where(city: "Athens")
  end



end
