class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status

  validates :name, :explain, presence: true

  validates :category_id, :status_id, numericality: { other_than: 1 , message: "が未選択です"}
end
