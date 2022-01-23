class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :record

  validates :post_code, presence: true
  validates :area_id, presence: true
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :building
  validates :tel, presence: true
end
