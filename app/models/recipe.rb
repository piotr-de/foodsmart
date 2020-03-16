class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :url, presence: true, uniqueness: true
  validates :energy, presence: true
  validates :carbs, presence: true
  validates :fat, presence: true
  validates :protein, presence: true
  validates :data, presence: true
end
