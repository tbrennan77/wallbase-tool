FactoryGirl.define do
  factory :color do    
    color_palette
    color_number            "034"
    name                    "Almond"
    hex                     "ded2ba"
    color_foundation        "W"
    selects                 true
    created_at              Time.zone.local(2000,1,1, 0,0,0)
    updated_at              Time.zone.local(2000,1,1, 0,0,0)
  end
end