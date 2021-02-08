require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    it '全ての情報が記入されていたら商品の投稿ができる' do
      expect(@item).to be_valid
    end
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態についての情報が必須であること' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end
    it '配送料の負担についての情報が必須であること' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
    end
    it '発送元の地域についての情報が必須であること' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 1')
    end
    it '発送までの日数についての情報が必須であること' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
    end
    it '販売価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '２３０'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is valid. Input half-width number')
    end
    it '販売価格は、¥300以上出ないと保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it '販売価格は、¥9,999,999以下出ないと保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
