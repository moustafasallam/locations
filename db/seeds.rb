0..1000.times do |n|

		e = GroupEvent.new
		e.name =  "#{Faker::Name.unique.name}_#{n}"
		e.description = Faker::Lorem.sentences(3).join(", ")
		e.state = ['draft', 'published'].sample
		e.start_date = Faker::Date.between(Date.today, Date.today + 300.days)
		e.end_date = e.start_date + [1..30].sample.first.days
		e.save!

end

GroupEvent.import(force: true)