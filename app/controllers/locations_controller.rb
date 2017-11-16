class LocationsController < ApplicationController

	def index
		@locations = params[:query].present? ? Location.search(params[:query]).records : []
	end

  def create

  end

end