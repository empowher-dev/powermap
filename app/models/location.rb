class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :address, presence: true
  validates :name, presence: true, uniqueness: true
  validates :picture_url, presence: true
  validates :link, presence: true
end
