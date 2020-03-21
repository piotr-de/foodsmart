class Rda < ApplicationRecord
  belongs_to :nutrient
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :gender, presence: true, inclusion: { in: [ "male", "female" ] }
  validates :age, presence: true
end
