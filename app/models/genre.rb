class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy
end
