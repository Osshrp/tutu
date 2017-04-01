class Carriage < ApplicationRecord
  belongs_to :train

  validates :car_type, presence: true
end
