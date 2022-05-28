class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字混合で入力"}
  validates :lastname_full, presence: true, format:{with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,message: "は全角ひらがな、カタカナ、漢字で入力"}
  validates :firstname_full, presence: true, format:{with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,message: "は全角ひらがな、カタカナ、漢字で入力"}
  validates :lastname_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/,message: "はカタカナで入力"}
  validates :firstname_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/,message: "はカタカナで入力"}
  validates :birthday, presence: true

  has_many :items
end
