class RecordDestination
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :address, :building, :tel, :item_id, :user_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :tel, format: {with: /\A\d{10}\z|\A\d{11}\z/ }
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Destination.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address, building: building, tel: tel, record_id: record.id)
  end
end


