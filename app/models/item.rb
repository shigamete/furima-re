class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingfee_payer
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user

  validates :name, :explain, :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:"は設定価格の範囲内で入力してください" }

  validates :category_id, :status_id, :shippingfee_payer_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 , message: "が未選択です"}
end
