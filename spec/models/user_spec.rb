require 'rails_helper'

describe 'userモデルのテスト' do
  let(:user) { FactoryBot.build(:user) } # Postのインスタンスを事前に生成

  context 'userの保存' do
    it '有効な内容の場合は保存される' do
      expect(user).to be_valid
    end
    it '無効な内容の場合は保存されない(name)' do
      user.name = ""
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("は2文字以上で入力してください")
    end
    it '無効な内容の場合は保存されない(nick_name)' do
      user.nick_name = ""
      expect(user).not_to be_valid
      expect(user.errors[:nick_name]).to include("は2文字以上で入力してください")
    end
    it '無効な内容の場合は保存されない(email)' do
      user.email = ""
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("を入力してください")
    end
    it '無効な内容の場合は保存されない(password)' do
      user.password = ""
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
end