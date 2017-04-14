class SearchesController < ApplicationController
  def show
    @railway_stations = RailwayStation.all
  end

  def create
    @trains = Search.trains(params[:start_station_id],
      params[:end_station_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
    render :show
  end
end
