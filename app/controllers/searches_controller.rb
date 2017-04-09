class SearchesController < ApplicationController
  def show
    @railway_stations = RailwayStation.all
  end

  def create
    @trains = Search.trains(search_params[:start_station_id], search_params[:last_station_id])
    render :show
  end

  private

  def search_params
    params.require(:stations).permit(:start_station_id, :last_station_id)
  end
end
