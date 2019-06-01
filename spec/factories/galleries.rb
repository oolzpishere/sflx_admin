FactoryBot.define do
  factory :gallery, class: "Work::Gallery" do
    sequence(:id)
    title { "title" }
    sequence(:position)

    factory :gallery_with_images do
      transient do
        galleries_count {2}
      end

      after(:create) do |gallery, evaluator|
        create_list(:image, evaluator.galleries_count,image: FilesTestHelper.jpg, gallery: gallery)
      end
    end
  end
end
