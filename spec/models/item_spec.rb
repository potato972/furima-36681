require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    category_id = Category.find_by(name: 'その他').id
    status_id = Status.find_by(name: '全体的に状態が悪い').id
    postage_id = Postage.find_by(name: '着払い（購入者負担）').id
    area_id = Area.find_by(name: '北海道').id
    day_id = Day.find_by(name: '1~2日で発送').id
  end

  describe '新規出品登録' do
    context '新規出品ができる場合' do
      it "image,item_name,content,category_id,status_id,postage_id,area_id,day_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '新規出品ができない場合' do
      it "item_nameが空では出品できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "contentが空では出品できない" do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it "category_idが空では出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空では出品できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "postage_idが空では出品できない" do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it "area_idが空では出品できない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "day_idが空では出品できない" do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円以下では出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceに半角数字以外が含まれている場合出品できない" do
        @item.price = '300あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
