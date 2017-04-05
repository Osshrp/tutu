class Carriage < ApplicationRecord
  belongs_to :train

  validates :bottom_places, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_save :set_type, :set_number

  scope :asc_ordered, -> { order(:number) }
  scope :desc_ordered, -> { order(number: :desc) }

  private

  def set_type
    car_types = { 'FirstClassCarriage' => 'св',
                  'SecondClassCarriage' => 'купе',
                  'ThirdClassCarriage' => 'плацкарт',
                  'CouchCarriage' => 'сидячий' }

    self.car_type = car_types[self.class.to_s]
  end

  def set_number
    carriages = train.carriages
    self.number ||= carriages.map { |car| car.number.to_i }.max + 1
  end
end
