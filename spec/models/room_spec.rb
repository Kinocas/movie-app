require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  context '投稿機能に問題がない場合' do
    it '全てが存在すれば登録できる' do
      expect(@room).to be_valid
    end
  end

  context '投稿機能に問題がある場合' do
    it 'room_nameが空では登録できない' do
      @room.room_name = ''
      @room.valid?
      expect(@room.errors.full_messages).to include "ルーム名を入力してください"
    end
    it 'purposeが空では登録できない' do
      @room.purpose = ''
      @room.valid?
      expect(@room.errors.full_messages).to include "目的を入力してください"
    end
    it 'userが空では登録できない' do
      @room.user = nil
      @room.valid?
      expect(@room.errors.full_messages).to include "ユーザーを入力してください"
    end
  end
end
