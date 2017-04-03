class SecondClassCarriage < Carriage
  validates :upper_places, :bottom_places, presence: true

  def car_type
    'купе'
  end
end
