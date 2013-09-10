FactoryGirl.define do
  factory :profile do
    style_type
    size                    "7.5"
    uuid                    "Vinyl"
    created_at              Time.zone.local(2000,1,1, 0,0,0)
    updated_at              Time.zone.local(2000,1,1, 0,0,0)
  end
end