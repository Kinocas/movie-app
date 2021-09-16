require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
  end
  context '投稿機能に問題がない場合' do
    it '全てが存在すれば登録できる' do
      expect(@chat).to be_valid
    end
  end

  context '投稿機能に問題がある場合' do
    it 'chatが空では登録できない' do
      @chat.chat = ''
      @chat.valid?
      expect(@chat.errors.full_messages).to include "チャットを入力してください"
    end
    it 'roomが空では登録できない' do
      @chat.room = nil
      @chat.valid?
      expect(@chat.errors.full_messages).to include "ルームを入力してください"
    end
    it 'userが空では登録できない' do
      @chat.user = nil
      @chat.valid?
      expect(@chat.errors.full_messages).to include "ユーザーを入力してください"
    end
  end
end
