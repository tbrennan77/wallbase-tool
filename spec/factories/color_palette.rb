FactoryGirl.define do
  factory :color_palette do        
    name                    "A"
    order_number            1
    created_at              Time.zone.local(2000,1,1, 0,0,0)
    updated_at              Time.zone.local(2000,1,1, 0,0,0)
  end
end