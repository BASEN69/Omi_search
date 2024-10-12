require 'rails_helper'

describe 'post_commentモデルのテスト' do
  let(:post_comment) { FactoryBot.build(:post_comment) } # Postのインスタンスを事前に生成

  context 'コメントの保存' do
    it '有効な内容の場合は保存される' do
      expect(post_comment).to be_valid
    end
    it '無効な内容の場合保存されない' do
      post_comment.comment = ""
      expect(post_comment).not_to be_valid
    end
  end
end