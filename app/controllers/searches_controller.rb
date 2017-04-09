class SearchesController < ApplicationController
  def show
    @railway_stations = RailwayStation.all
  end

  def create
    @trains = Route.search_trains(search_params[:start_station], search_params[:last_station])
  end

  private

  def search_params
    params.require(:stations).permit(:start_station, :last_station)
  end
end
