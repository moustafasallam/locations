class LocationsController < ApplicationController

	def index
		@locations = params[:query].present? ? Location.search(params[:query]).results : []
	end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
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

  def update
    @validator = GroupEventValidator.new(group_event_params)
    @group_event = GroupEvent.where(id: params[:id]).first
    if @group_event.blank?
      flash[:error] = "can't find Group event!"
      render template: admin_group_events_path and return
    end
    if @validator.is_valid? == true
      unless @group_event.update_attributes(group_event_params)
        flash[:error] = @group_event.errors.full_messages
        render template: "admin/group_events/edit"
      end
    else
      flash[:error] = @validator.message
      render template: "admin/group_events/new" and return
    end
    flash[:notice] = 'Event was successfully updated.'
    redirect_to admin_group_event_path
  end

  def destroy
    @group_event = GroupEvent.find(params[:id])
    @group_event.destroy
    redirect_to admin_group_events_path
  end

private

  def group_event_params
    params.require(:group_event).permit(:name, :description, :state, :start_date, :end_date, :location)
  end

end