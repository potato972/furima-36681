require 'rails_helper'

RSpec.describe RecordDestination, type: :model do
  before do
    @record_destination = FactoryBot.build(:record_destination)
  end

  describe '商品購入機能' do
    context '商品購入ができる場合' do
      it 'post_code,area_id,municipalities,address,building,telが存在すれば購入できる' do
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
        @record_destination.post_code ='9999999'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Post code is invalid")
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
      it 'telが10桁以上11桁以内の半角数値以外では購入できない' do
        @record_destination.tel = '９９９９９９９９９'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Tel is invalid")
      end
    end
  end
end
