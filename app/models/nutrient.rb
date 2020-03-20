class Nutrient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :unit, presence: true, uniqueness: true
end
