class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingfee_payer
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :name, :explain, presence: true

  validates :category_id, :status_id, :shippingfee_payer_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 , message: "が未選択です"}
end
