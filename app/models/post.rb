class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 200 }
  validates :category, presence: true
  

end
