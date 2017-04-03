class ThirdClassCarriage < Carriage
  validates :upper_places, :bottom_places, presence: true
  validates :side_bottom_places, :side_upper_places, presence: true
end
