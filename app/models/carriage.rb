class Carriage < ApplicationRecord
  belongs_to :train

  validates :bottom_places, presence: true

  before_save :set_type

  # scope: :ordered, -> { order(:number) }

  private

  def set_type
    car_types = { 'FirstClassCarriage' => 'св',
                  'SecondClassCarriage' => 'купе',
                  'ThirdClassCarriage' => 'плацкарт',
                  'CouchCarriage' => 'сидячий' }

    self.car_type = car_types[self.class.to_s]
  end
end
