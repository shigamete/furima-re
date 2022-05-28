FactoryBot.define do
  factory :user do
    nickname  {Faker::Name.initials(number: 4)}
    email     {Faker::Internet.free_email}
    password  {"a1" + Faker::Internet.password(min_length: 4)}
    password_confirmation { password }
    lastname_full  {"山田"}
    firstname_full {"太郎"}
    lastname_kana  {"ヤマダ"}
    firstname_kana {"タロウ"}
    birthday   {"20000101"}
  end
end