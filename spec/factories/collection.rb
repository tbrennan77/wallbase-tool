FactoryGirl.define do
  factory :collection do    
    name                    "Millwork"
    material                "Vinyl"
    collection_description  "People prefer when all the dots are connected."
    icon_1                  true
    icon_2                  true
    icon_3                  true
    icon_4                  true
    icon_5                  true
    created_at              Time.zone.local(2000,1,1, 0,0,0)
    updated_at              Time.zone.local(2000,1,1, 0,0,0)
  end
end