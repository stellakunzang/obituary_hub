class Obituaries::CovidController < ApplicationController
  def index
    @obituaries_api = ObituarySearch.new.search_covid_obituaries
    @obituaries = Obituary.where(covid: true).paginate(page: params[:page], per_page: 10)
  end
end
