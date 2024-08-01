class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :
  
  validates :name, uniqueness: true
  validates :introduction, uniqueness: true
  validates :category, uniqueness: true
  
end
