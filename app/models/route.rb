class Route < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  def station_time(station, method)
    railway_stations_routes.where(route_id: id, railway_station_id: station.id)
      .first.send(method)
  end

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end
end
