FactoryGirl.define do
  factory :group_event do
  	id						    { rand(1234567..9999999) }
  	name  				    { "my_event" }
    description       { Faker::Lorem.sentences(3) }
    state             { "draft" }
    start_date        { Time.now }
    end_date          { Time.now + 2.days }
  end
end

