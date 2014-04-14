class Car < ActiveRecord::Base
  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true
  validates :manufacturer_id, presence: true

  validates_numericality_of :year, greater_than: 1980

  belongs_to :manufacturer
end
