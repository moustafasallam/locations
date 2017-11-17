class LocationsController < ApplicationController

	def index
		@locations = params[:query].present? ? Location.search(params[:query]).records : []
	end

  def create
  	found = Location.where(country_code: params[:country_code], city_name: params[:city_name]).first
  	if found.blank? || found.updated_at.to_date != Time.now.to_date
  		w = OpenWeather.new(params)
      city_id = found.present? ? found.city_id : nil
  		w.get_response('/weather/', city_id)
  		if w.is_successful
  			data = Location.prepare_data(w.response)
  			found ||= Location.new
        found.update_attributes!(data)
  			success(found.as_json)
  		else
  			error(w.response['cod'], w.response['message'])
  		end
  	else
  		success(found.as_json)
  	end
  end

end


