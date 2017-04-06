class Carriage < ApplicationRecord
  belongs_to :train

  validates :bottom_places, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_save :set_number

  scope :asc_ordered, -> { order(:number) }
  scope :desc_ordered, -> { order(number: :desc) }
  scope :ordered, ->(train) { train.sort? ? asc_ordered : desc_ordered }

  CAR_TYPE = { 'FirstClassCarriage' => 'св',
               'SecondClassCarriage' => 'купе',
               'ThirdClassCarriage' => 'плацкарт',
               'CouchCarriage' => 'сидячий' }

  private

  def set_number
    self.number ||= train.carriages.maximum(:number) + 1
  end
end
