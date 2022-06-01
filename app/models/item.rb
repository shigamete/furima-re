class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingfee_payer
  belongs_to :prefecture

  validates :name, :explain, presence: true

  validates :category_id, :status_id, :shippingfee_payer_id, :prefecture_id, numericality: { other_than: 1 , message: "が未選択です"}
end
