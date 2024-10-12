# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:post) { create(:post, name:'hoge',introduction:'introduction',category:'hoge',user_id:'2',genre_id:'2',address:'hoge',latitude:'150',longitude:'150') }
  before do
    visit posts_path
  end
  context '表示の確認' do
    it '投稿一覧画面に「投稿一覧」と記載されているか' do
      expent(pege).to have_content '投稿一覧'
    end
    it 'posts_pathが/postsか' do
      expent(current_path).to ep('/posts')
    end
  end
end