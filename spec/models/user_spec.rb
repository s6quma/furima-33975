require 'rails_helper'

RSpec.describe User, type: :model do
   describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'eamilが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = "buzqksybb.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
     it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = "000000"
      @user.password_confirmation = "000000b"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが6文字以上であれば登録できること' do
      @user.password = "00000a"
      @user.password_confirmation = "00000a"
      expect(@user).to be_valid
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = "00000"
      @user.password_confirmation ="00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ユーザー姓は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = "nana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end
    it 'ユーザー名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = "minami"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it 'ユーザー姓（フリガナ）は、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = "ああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end
    it 'ユーザー名（フリガナ）は、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = "おお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birtydayが空だと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
