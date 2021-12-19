require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user, nickname: "")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = FactoryBot.build(:user, last_name: "")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = FactoryBot.build(:user, first_name: "")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_readingが空では登録できない' do
      user = FactoryBot.build(:user, last_name_reading: "")
      user.valid?
      expect(user.errors.full_messages).to include("Last name reading can't be blank")
    end
    it 'first_name_readingが空では登録できない' do
      user = FactoryBot.build(:user, first_name_reading: "")
      user.valid?
      expect(user.errors.full_messages).to include("First name reading can't be blank")
    end
    it 'birthdayが空では登録できない' do
    end
  end
end
