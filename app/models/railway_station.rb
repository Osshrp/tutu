class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def update_postion(position, route)
    station_in_route = RailwayStationsRoute.where(railway_station: self, route: route).first
    station_in_route.save
  end
end
