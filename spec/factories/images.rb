FactoryBot.define do
  factory :image, class: "Work::Image" do
    sequence(:id)
    sequence(:position)
    gallery
  end
end
