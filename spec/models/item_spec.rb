require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できる場合' do
      it '全ての項目が正しく入力されている場合は出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品画像が添付されていない場合は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像 を添付してください')
      end

      it '商品名が空の場合は出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名 を入力してください')
      end

      it '商品の説明が空の場合は出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('説明 を入力してください')
      end

      it 'カテゴリーが選択されていない場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリー を選択してください')
      end

      it '商品の状態が選択されていない場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態 を選択してください')
      end

      it '配送料の負担が選択されていない場合は出品できない' do
        @item.shipping_cost_responsibility_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担 を選択してください')
      end

      it '発送元の地域が選択されていない場合は出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元地域 を選択してください')
      end

      it '発送までの日数が選択されていない場合は出品できない' do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数 を選択してください')
      end

      it '価格が空の場合は出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格 を入力してください')
      end

      it '価格が300円未満の場合は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格 は300円以上で入力してください')
      end

      it '価格が10,000,000円以上の場合は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格 は9,999,999円以下で入力してください')
      end

      it '価格が半角数値でない場合は出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格 は数値で入力してください')
      end
    end
  end
end
