class Location < ActiveRecord::Base
  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  validates :city, presence: true
end
