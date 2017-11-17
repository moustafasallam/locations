class LocationsController < ApplicationController

	def index
		@locations = params[:query].present? ? Location.search(params[:query]).records : []
	end

  def create
  	found = Location.where(country_code: params[:country_code], city_name: params[:city_name]).first
  	if found.blank?
  		w = OpenWeather.new(params)
  		w.get_by_name('/weather/')
  		if w.is_successful
  			data = Location.prepare_data(w.get_response)
  			found = Location.create!(data)
  			success(found.as_json)
  		else
  			error(w.get_response['cod'], w.get_response['message'])
  		end
  	elsif found.updated_at.to_date != Time.now.to_date
  		w = OpenWeather.new(params)
  		w.get_by_id('/weather/', found.city_id)
  		if w.is_successful
  			data = Location.prepare_data(w.get_response)
  			found.update_attributes!(data)
  			success(found.as_json)
  		else
  			error(w.get_response['cod'], w.get_response['message'])
  		end
  	else
  		success(found.as_json)
  	end
  end

end


