class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  belongs_to :genre
  has_many :post_comments,dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 200 }
  validates :category, presence: true
  validates :address, presence: true

  geocoded_by :address
 # 手動入力がない場合のみ geocode を実行
  after_validation :geocode, if: ->(obj) { obj.latitude.blank? && obj.longitude.blank? }

  FILE_NUMBER_LIMIT = 3

  validate :validate_number_of_files

  def self.search_for(content, method)
    if method == 'partial'
      Post.where('name LIKE ? OR introduction LIKE ? ', "%#{content}%", "%#{content}%")
    elsif method == 'perfect'
      Post.where('name = ? OR introduction = ?', content, content)
    end
  end

  private

  def validate_number_of_files
  return if images.length <= FILE_NUMBER_LIMIT
  errors.add(:images,"に添付出来る画像は#{FILE_NUMBER_LIMIT}件までです")
  end

end
