class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :energy, presence: true
  validates :carbs, presence: true
  validates :fat, presence: true
  validates :fibre, presence: true
  validates :protein, presence: true
end
