class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :url, presence: true, uniqueness: true
  validates :energy, presence: true, numericality: true
  validates :carbs, presence: true, numericality: true
  validates :fat, presence: true, numericality: true
  validates :protein, presence: true, numericality: true
  validates :data, presence: true
end
