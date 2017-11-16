class LocationsController < ApplicationController

	def index
		@locations = params[:query].present? ? Location.search(params[:query]).records : []
	end

  def create
    @validator = GroupEventValidator.new(group_event_params)
    if @validator.is_valid? == true
      @group_event = GroupEvent.new(group_event_params)
      unless @group_event.save
        flash[:error] = @group_event.errors.full_messages
        render template: "new" and return
      end
    else
      flash[:error] = @validator.message
      render template: "admin/group_events/new" and return
    end
    flash[:notice] = 'New Event was successfully created.'
    redirect_to edit_admin_group_event_path(@group_event)
  end


end