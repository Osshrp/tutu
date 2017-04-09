class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { select('railway_stations.*,
    railway_stations_routes.station_index')
    .joins(:railway_stations_routes)
    .order('railway_stations_routes.station_index').distinct }


  def update_position(position, route)
    station_in_route = station_in_route(route)
    station_in_route.update(station_index: position) if station_in_route
  end

  def update_time(arrive_time, depart_time, route)
    station_in_route = station_in_route(route)
    station_in_route.update(arrive_time: arrive_time,
      depart_time: depart_time) if station_in_route
  end

  def station_in_route(route)
    station_in_route ||= railway_stations_routes.where(route: route).first
  end

  def attr_in(route, attr)
    station_in_route(route).try(attr)
  end
end
