FactoryBot.define do
  factory :user, class: "Account::User" do
    id { 3 }
    email { Faker::Internet.email }
    password { "password"}
    password_confirmation { "password" }
  end
end
