class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  scope :through_station, ->(station) { joins(route: :railway_stations)
    .where("railway_station_id = ?", station) }

  def carriages_count(type)
    carriages.where(type: type).count
  end

  def places
    places = {}
    carriages.each do |carriage|
      if carriage.car_type == 'купе'
        places[:second_class_upper_places] = carriage.upper_places
        places[:second_class_bottom_places] = carriage.bottom_places
      else
        places[:third_class_upper_places] = carriage.upper_places
        places[:third_class_bottom_places] = carriage.bottom_places
      end
    end
    places
  end

  def places_quantity(carriage_type, place_type)
    carriages.where(type: carriage_type).sum(place_type)
  end
end
