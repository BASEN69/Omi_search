# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:user) { create(:user) }
  let!(:genre) { create(:genre) }
  let!(:post) { create(:post, name:'hoge',introduction:'introduction',category:'hoge',address:'hoge',latitude:'150',longitude:'150') }
  before do
    visit posts_path
  end
  context '表示の確認' do
    it '投稿一覧画面に「投稿一覧」と記載されているか' do
      expect(page).to have_content '投稿一覧'
    end
    it 'posts_pathが/postsか' do
      expect(current_path).to eq('/posts')
    end
  end
end