require 'rails_helper'

RSpec.describe PurchaseHistoryAddress, type: :model do
  describe '住所の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: user.id, item_id: item.id)
      sleep(0.5)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_history_address).to be_valid
    end
    it 'user_idが空だと保存できないこと' do
    end
    it 'item_idが空だと保存できないこと' do
    end
    it 'tokenが空だと保存できないこと' do
      @purchase_history_address.token = ''
      @purchase_history_address.valid?
      expect(@purchase_history_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @purchase_history_address.postal_code = ''
      @purchase_history_address.valid?
      expect(@purchase_history_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_history_address.postal_code = '0005555'
      @purchase_history_address.valid?
      expect(@purchase_history_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @purchase_history_address.prefecture = '1'
      @purchase_history_address.valid?
      expect(@purchase_history_address.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空だと保存できないこと' do
      @purchase_history_address.city = ''
      @purchase_history_address.valid?
      expect(@purchase_history_address.errors.full_messages).to include("City can't be blank")
    end
    it 'block_numberが空だと保存できないこと' do
      @purchase_history_address.block_number = ''
      @purchase_history_address.valid?
      expect(@purchase_history_address.errors.full_messages).to include("Block number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @purchase_history_address.building_name = ''
      expect(@purchase_history_address).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_history_address.phone_number = ''
      @purchase_history_address.valid?
      expect(@purchase_history_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @purchase_history_address.phone_number = '０９０１１１１１１１１１１'
      @purchase_history_address.valid?
      expect(@purchase_history_address.errors.full_messages).to include('Phone number is valid. Input half-with number')
    end
  end
end
