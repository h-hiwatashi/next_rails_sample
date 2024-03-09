FactoryBot.define do
  factory :article do
    # article の親テーブルが user であることが定義済みのため
    user
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    status { :published }
  end
end
