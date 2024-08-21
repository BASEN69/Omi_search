class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments,dependent: :destroy

  def self.search_for(content, method)
    if method == 'partial'
      User.where('nick_name LIKE ?', '%' + content + '%')
    elsif method == 'perfect'
      User.where(nick_name: content)
    end
  end

  validates :name, uniqueness: true, length: 2..20
  validates :nick_name, uniqueness: true, length: 2..10
end
