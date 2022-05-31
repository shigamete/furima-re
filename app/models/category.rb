class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: "---" },
    { id: 2, name: "レディース" },
    { id: 3, name: "メンズ" },
    { id: 4, name: "ベビー・キッズ" },
    { id: 5, name: "本・音楽・ゲーム" }
  ]

  include ActiveHash::Associations
  has_many :items

end