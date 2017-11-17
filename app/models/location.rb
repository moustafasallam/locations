require 'elasticsearch/model'
class Location < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def as_indexed_json(options={})
    as_json(only: [:id, :city_name, :weather_title, :weather_description, :country_code])
  end

  def self.prepare_data(res)
  	{
			"city_name"     			=> res['name'],
			"city_id"       			=> res['id'],
			"country_code"  			=> res['sys']['country'],
			"sunrise"       			=> res['sys']['sunrise'],
			"sunset"        			=> res['sys']['sunset'],
		 	"wind_speed"    			=> res['wind']['speed'],
		 	"wind_degree"   			=> res['wind']['deg'],
		 	"temperature"   			=> res['main']['temp'],
		 	"min_temp"      			=> res['main']['temp_min'],
		 	"max_temp"      			=> res['main']['temp_max'],
		 	"humidity"            => res['main']['humidity'],
		 	"weather_title"       => res['weather'][0]['main'],
		 	"weather_description" => res['weather'][0]['description'],
		 	"latitude"						=> res['coord']['lat'],
		 	"longitude"						=> res['coord']['lon'],
		}
  end

end