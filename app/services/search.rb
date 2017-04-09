class Search
  def self.trains(start_station, last_station)
    Train.through_station(start_station) && Train.through_station(last_station)
  end
end
