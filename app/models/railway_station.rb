class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  # default_scoup(order: :id)

  def update_position(position, route)
    station_in_route = self.railway_stations_routes.where(route: route).first
    station_in_route.station_index = position
    station_in_route.save if station_in_route
  end
end
