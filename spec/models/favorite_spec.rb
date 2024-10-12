require 'rails_helper'

describe 'favoriteモデルのテスト' do
  let(:favorite) { FactoryBot.build(:favorite) } # Postのインスタンスを事前に生成

  context 'いいねの保存' do
    it '有効な内容の場合は保存される' do
      expect(favorite).to be_valid
    end
  end
end