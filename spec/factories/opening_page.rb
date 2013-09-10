FactoryGirl.define do
  factory :opening_page do    
    body                    "<p>Body</p>"    
    created_at              Time.zone.local(2000,1,1, 0,0,0)
    updated_at              Time.zone.local(2000,1,1, 0,0,0)
  end
end