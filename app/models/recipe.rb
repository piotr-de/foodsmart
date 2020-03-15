class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :url, presence: true, uniqueness: true
  validates :data, presence: true
end
