class SearchesController < ApplicationController
  def show
    @railway_stations = RailwayStation.all
  end

  def create
    @trains = Search.trains(params[:stations][:start_station_id],
      params[:stations][:end_station_id])
    @start_station = RailwayStation.find(params[:stations][:start_station_id])
    @end_station = RailwayStation.find(params[:stations][:end_station_id])
    render :show
  end
end
