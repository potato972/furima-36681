class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :Postage
  belongs_to :area
  belongs_to :day
  has_one_attached :image

  validates :item_name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :category_id, :status_id, :postage_id, :area_id, :day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\Z/ } 
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equel_to: 9_999_999 },
                      presence: { message: "can't be blank"}
  belongs_to :user
  
end
