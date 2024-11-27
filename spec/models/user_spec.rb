require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'emailは一意性でないと登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'emailは＠を含まないと登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'パスワードが空では登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'バスワードが６文字以上でないと登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'パスワードは半角英数字混合でないと登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'パスワードとパスワード（確認）の値が一致しないと登録できない' do
      user = FactoryBot.build(:user)
    end
  end
end
