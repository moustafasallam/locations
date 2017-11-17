FactoryGirl.define do
  factory :location do
  	id						    				{ rand(1234567..9999999) }
    city_name    							{"Cairo"}
		city_id       						{360630}
		country_code  						{"EG"}
		sunrise       						{1510892533}
		sunset        						{1510930658}
		wind_speed       					{5.7}
		wind_degree								{30}
		temperature								{299.15}
		min_temp				  				{299.15}
		max_temp				  				{299.15}
		humidity				  				{57}
		weather_title							{"Clear"}
		weather_description				{"Clear Sky"}
		latitude									{30.06}
		longitude									{31.25}
		created_at                {Time.now}
		updated_at                {Time.now}
  end


 factory :api_sample, class: Hash do
 		basic {{
		coord: {
		lon: -0.13,
		lat: 51.51
		},
		weather: [
		{
		id: 300,
		main: "Drizzle",
		description: "light intensity drizzle",
		icon: "09d"
		}
		],
		base: "stations",
		main: {
		temp: 280.32,
		pressure: 1012,
		humidity: 81,
		temp_min: 279.15,
		temp_max: 281.15
		},
		visibility: 10000,
		wind: {
		speed: 4.1,
		deg: 80
		},
		clouds: {
		all: 90
		},
		dt: 1485789600,
		sys: {
		type: 1,
		id: 5091,
		message: 0.0103,
		country: "GB",
		sunrise: 1485762037,
		sunset: 1485794875
		},
		id: 2643743,
		name: "London",
		cod: 200
		}.as_json}
		initialize_with { attributes }
  end

end

