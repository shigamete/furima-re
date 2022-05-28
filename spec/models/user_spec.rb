require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー登録" do
    context "新規登録ができるとき" do
      it "nickname,email,password,lastname_full,firstname_full,lastname_kana,firstname_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid 
      end
    end
    context "新規登録ができないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "lastname_fullが空では登録できない" do
        @user.lastname_full = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname full can't be blank"
      end
      it "firstname_fullが空では登録できない" do
        @user.firstname_full = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname full can't be blank"
      end
      it "lastname_kanaが空では登録できない" do
        @user.lastname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
      end
      it "firstname_kanaが空では登録できない" do
        @user.firstname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.password = "abcd1234"
        @user.password_confirmation = "1234abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordが6文字以下では登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordが129文字以上では登録できない" do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
      end
      it "passwordが半角英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字混合で入力"
      end
      it "passwordが半角数字のみでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字混合で入力"
      end
      it "passwordが全角では登録できない" do
        @user.password = "テストＡＢＣ"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字混合で入力"
      end
      it "passwordに記号が含まれると登録できない" do
        @user.password = "abcd1234@"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字混合で入力"
      end
      it "lastname_fullが半角では登録できない" do
        @user.lastname_full = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname full は全角ひらがな、カタカナ、漢字で入力"
      end
      it "firstname_fullが半角では登録できない" do
        @user.firstname_full = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname full は全角ひらがな、カタカナ、漢字で入力"
      end
      it "lastname_kanaがひらがなでは登録ができない" do
        @user.lastname_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana はカタカナで入力"
      end
      it "firstname_kanaがひらがなでは登録ができない" do
        @user.firstname_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana はカタカナで入力"
      end
    end
  end
end
