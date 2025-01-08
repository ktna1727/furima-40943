require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_form = OrderForm.new(
      post_number: '123-4567',
      area_id: 2,
      municipalities: '横浜市緑区',
      street_address: '青山1-1-1',
      building_name: '柳ビル103',
      phone_number: '09012345678',
      token: 'tok_abcdefghijk00000000000000000',
      user_id: @user.id,
      item_id: @item.id
    )
  end

  context '内容に問題がない場合' do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@order_form).to be_valid
    end

    it '建物名が空でも購入できる' do
      @order_form.building_name = nil
      expect(@order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it '郵便番号が空だと保存できない' do
      @order_form.post_number = nil
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('郵便番号 を入力してください')
    end

    it '郵便番号が正しい形式でないと保存できない' do
      @order_form.post_number = '1234567'
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('郵便番号 は3桁-4桁の半角数字で入力してください')
    end

    it '都道府県が「1」だと保存できない' do
      @order_form.area_id = 1
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('都道府県 を選択してください')
    end

    it '市区町村が空だと保存できない' do
      @order_form.municipalities = nil
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('市区町村 を入力してください')
    end

    it '番地が空だと保存できない' do
      @order_form.street_address = nil
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('番地 を入力してください')
    end

    it '電話番号が空だと保存できない' do
      @order_form.phone_number = nil
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('電話番号 を入力してください')
    end

    it '電話番号に半角数字以外が含まれている場合は保存できない' do
      @order_form.phone_number = '090-1234-5678'
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('電話番号 は10から11桁の半角数字で入力してください')
    end

    it '電話番号が9桁以下では保存できない' do
      @order_form.phone_number = '090123456'
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('電話番号 は10から11桁の半角数字で入力してください')
    end

    it '電話番号が12桁以上では保存できない' do
      @order_form.phone_number = '090123456789'
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('電話番号 は10から11桁の半角数字で入力してください')
    end
    it 'ユーザーが紐付いていなければ購入できない' do
      @order_form.user_id = nil
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('ユーザー情報 が紐付いていません')
    end
    it '商品が紐付いていなければ購入できない' do
      @order_form.item_id = nil
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('商品情報 が紐付いていません')
    end
    it 'クレジットカード情報（トークン）が空だと保存できない' do
      @order_form.token = nil
      expect(@order_form).to_not be_valid
      expect(@order_form.errors.full_messages).to include('カード情報 を入力してください')
    end
  end
end
