class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 200 }
  validates :category, presence: true

  FILE_NUMBER_LIMIT = 3

  validate :validate_number_of_files
  private

  def validate_number_of_files
  return if images.length <= FILE_NUMBER_LIMIT
  errors.add(:images,"に添付出来るの画像は#{FILE_NUMBER_LIMIT}件までです")
  end

end
