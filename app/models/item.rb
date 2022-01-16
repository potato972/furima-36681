class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :area
  belongs_to :day
  has_one_attached :image
  belongs_to :user


  validates :image, presence: true
  validates :item_name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :category_id, :status_id, :postage_id, :area_id, :day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
                      presence: { message: "can't be blank"}  
end
