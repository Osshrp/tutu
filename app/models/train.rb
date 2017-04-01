class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def second_class_cars
    carriages.where("car_type = 'купе'").count
  end

  def third_class_cars
    carriages.where("car_type = 'плацкарт'").count
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
end
