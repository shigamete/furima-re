class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, format:{with: /(?=.[a-zA-Z])(?=.\d)[a-zA-Z\d]/, message: "は英数字混合で入力"}
  validates :lastname_full, presence: true
  validates :firstname_full, presence: true
  validates :lastname_kana, presence: true
  validates :firstname_kana, presence: true

  has_many :items
end
