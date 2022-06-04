require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品登録" do
    context "商品の登録ができるとき" do
      it "name,explain,category_id,status_id,shippingfee_payer_id,prefecture_id,shipping_day_id,price,image,user_idがあれば商品の登録ができる" do
      expect(@item).to be_valid
      end
    end
    context "商品の登録ができないとき" do
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "explainが空では登録できない" do
        @item.explain = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain can't be blank"
      end
      it "category_idが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category が未選択です"
      end
      it "status_idが空では登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Status が未選択です"
      end
      it "shippingfee_payer_idが空では登録できない" do
        @item.shippingfee_payer_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Shippingfee payer が未選択です"
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture が未選択です"
      end
      it "shipping_day_idが空では登録できない" do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day が未選択です"
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "userが紐付いていなければ登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
      it "priceが半角数字でなければ登録できない" do
        @item.price = "test"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は設定価格の範囲内で入力してください"
      end
      it "priceは299円以下では登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は設定価格の範囲内で入力してください"
      end
      it "priceは10000000円以上では登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は設定価格の範囲内で入力してください"
      end
    end
  end
end

