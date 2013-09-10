FactoryGirl.define do
  factory :collection_section do
    collection
    title          "Title"
    body           "Body Text"
    created_at     Time.zone.local(2000,1,1, 0,0,0)
    updated_at     Time.zone.local(2000,1,1, 0,0,0)
  end
end