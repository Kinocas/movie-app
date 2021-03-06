require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    @movie = FactoryBot.build(:movie)
  end
  context '投稿機能に問題がない場合' do
    it '全てが存在すれば登録できる' do
      expect(@movie).to be_valid
    end
    it 'imageが空でも登録できる' do
      @movie.image = nil
      expect(@movie).to be_valid
    end
    it 'image_urlが空でも登録できる' do
      @movie.image_url = ''
      expect(@movie).to be_valid
    end
    it 'imageとimage_urlが空でも登録できる' do
      @movie.image = nil
      @movie.image_url = ''
      expect(@movie).to be_valid
    end
  end

  context '投稿機能に問題がある場合' do
    it 'movie_titleが空では登録できない' do
      @movie.movie_title = ''
      @movie.valid?
      expect(@movie.errors.full_messages).to include "タイトルを入力してください"
    end
    it 'thoughtが空では登録できない' do
      @movie.thought = ''
      @movie.valid?
      expect(@movie.errors.full_messages).to include "感想を入力してください"
    end
    it 'genre_idが空では登録できない' do
      @movie.genre_id = ''
      @movie.valid?
      expect(@movie.errors.full_messages).to include "ジャンルを入力してください"
    end
    it 'evaluationが空では登録できない' do
      @movie.evaluation = ''
      @movie.valid?
      expect(@movie.errors.full_messages).to include "評価を入力してください"
    end
    it 'releaseが空では登録できない' do
      @movie.release = ''
      @movie.valid?
      expect(@movie.errors.full_messages).to include "公開を入力してください"
    end
    it 'userが空では登録できない' do
      @movie.user = nil
      @movie.valid?
      expect(@movie.errors.full_messages).to include "ユーザーを入力してください"
    end
    it 'genre_idが数値以外では登録できない' do
      @movie.genre_id = 'a'
      @movie.valid?
      expect(@movie.errors.full_messages).to include "ジャンルは数値で入力してください"
    end
    it 'evaluationが0より小さいと登録できない' do
      @movie.evaluation = -1
      @movie.valid?
      expect(@movie.errors.full_messages).to include "評価は0以上の値にしてください"
    end
    it 'evaluationが5より大きいと登録できない' do
      @movie.evaluation = 6
      @movie.valid?
      expect(@movie.errors.full_messages).to include "評価は5以下の値にしてください"
    end
  end
end
