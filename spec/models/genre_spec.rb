require 'rails_helper'

describe 'genreモデルのテスト' do
  let(:genre) { FactoryBot.build(:genre) } # Postのインスタンスを事前に生成

  context '都道府県の保存' do
    it '有効な内容の場合は保存される' do
      expect(genre).to be_valid
    end
    it '無効な内容の場合保存されない(name)' do
      genre.name = ""
      expect(genre).not_to be_valid
    end
    it '無効な内容の場合保存されない(latitude)' do
      genre.latitude = ""
      expect(genre).not_to be_valid
    end
    it '無効な内容の場合保存されない(longitude)' do
      genre.longitude = ""
      expect(genre).not_to be_valid
    end
  end
end