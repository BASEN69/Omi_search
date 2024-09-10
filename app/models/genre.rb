class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
