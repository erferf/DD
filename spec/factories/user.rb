FactoryGirl.define do
  factory :user do
    provider  'orcid'
    name  'John Doe'
    created_at  { Time.now }
    admin false
    editor false

    factory :admin do
      admin true
    end

    factory :editor do
      editor true
    end

  end
end
