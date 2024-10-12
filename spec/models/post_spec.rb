# frozen_string_literal: true

require 'rails_helper'

describe 'postモデルのテスト' do
  let(:post) { FactoryBot.build(:post) } # Postのインスタンスを事前に生成

  context '投稿の保存' do
    it '有効な投稿内容の場合は保存される' do
      expect(post).to be_valid
    end

    it '無効な投稿の場合は保存されない(name)' do
      post.name = ""  # 無効なデータを設定
      expect(post).not_to be_valid
      expect(post.errors[:name]).to include("を入力してください")  # エラーメッセージの確認
    end
    it '無効な投稿の場合は保存されない(intrduction)' do
      post.introduction = ""  # 無効なデータを設定
      expect(post).not_to be_valid
      expect(post.errors[:introduction]).to include("を入力してください")  # エラーメッセージの確認
    end
    it '無効な投稿の場合は保存されない(category)' do
      post.category = ""  # 無効なデータを設定
      expect(post).not_to be_valid
      expect(post.errors[:category]).to include("を入力してください")  # エラーメッセージの確認
    end
    it '無効な投稿の場合は保存されない(address)' do
      post.address = ""  # 無効なデータを設定
      expect(post).not_to be_valid
      expect(post.errors[:address]).to include("を入力してください")  # エラーメッセージの確認
    end
    it '無効な投稿の場合は保存されない(latitude)' do
      post.latitude = ""  # 無効なデータを設定
      expect(post).not_to be_valid
      expect(post.errors[:latitude]).to include("を入力してください")  # エラーメッセージの確認
    end
    it '無効な投稿な場合は保存されない(longitude)' do
      post.longitude = ""
      expect(post).not_to be_valid
      expect(post.errors[:longitude]).to include("を入力してください")
    end
  end
end
