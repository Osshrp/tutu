class Carriage < ApplicationRecord
  belongs_to :train

  validates :bottom_places, presence: true
end
