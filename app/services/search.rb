module Search
  def self.trains(start_station, end_station)
    Train.through_station(start_station) & Train.through_station(end_station)
  end
end
