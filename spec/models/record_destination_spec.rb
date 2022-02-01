require 'rails_helper'

RSpec.describe RecordDestination, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @record_destination = FactoryBot.build(:record_destination, user_id: @user.id, item_id: @item.id)

    sleep 0.5
  end

  describe '商品購入機能' do
    context '商品購入ができる場合' do
      it 'post_code,area_id,municipalities,address,building,telとトークンが存在すれば購入できる' do
        expect(@record_destination).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @record_destination.building = ''
        expect(@record_destination).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'post_codeが空では購入できない' do
        @record_destination.post_code = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが3桁ハイフン4桁の半角数字以外では購入できない' do
        @record_destination.post_code = '9999999'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Post code is invalid')
      end
      it 'area_idが空では購入できない' do
        @record_destination.area_id = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Area can't be blank")
      end
      it 'areaで「---」が選択されている場合は出品できない' do
        @record_destination.area_id = '1'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
        @record_destination.municipalities = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では購入できない' do
        @record_destination.address = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空では購入できない' do
        @record_destination.tel = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが9桁以下では購入できない' do
        @record_destination.tel = '999999999'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが12桁以上では購入できない' do
        @record_destination.tel = '999999999999'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Tel is invalid')
      end
      it 'telに半角数字以外が含まれている場合は購入できない' do
        @record_destination.tel = '９９９９９９９９９９９'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Tel is invalid')
      end
      it 'トークンが空では購入でいない' do
        @record_destination.token = nil
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ購入できない' do
        @record_destination.user_id = nil
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できない' do
        @record_destination.item_id = nil
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
