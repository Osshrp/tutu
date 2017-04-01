class Carriage < ApplicationRecord
  belongs_to :train

  validates :car_type, presence: true

  # attr_reader :places
  #
  # def set_places
  #   self.places = [ upper_places, bottom_places ]
  # end
  #
  # def de
  #   @x
  # end
  #
  # private
  # attr_writer :places
end
