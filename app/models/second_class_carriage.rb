class SecondClassCarriage < Carriage
  validates :upper_places, :bottom_places, presence: true
end
