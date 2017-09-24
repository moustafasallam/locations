class Admin::GroupEventsController < ApplicationController

	def index
		@group_events = params[:query].present? ? GroupEvent.search(params[:query]).results : []
	end

  def show
    @group_event = GroupEvent.find(params[:id])
  end

  def new
    @group_event = GroupEvent.new
  end

  def edit
    @group_event = GroupEvent.find(params[:id])
  end

  def create
    @group_event = GroupEvent.new(group_event_params)
    unless @group_event.save
      flash[:error] = @group_event.errors.full_messages
      render template: "new" and return
    end
    flash[:notice] = 'New Event was successfully created.'
    redirect_to edit_admin_group_event_path(@group_event)
  end

  def update
    @group_event = GroupEvent.find(params[:id])
    if @group_event.update_attributes(group_event_params)
      flash[:notice] = 'Event was successfully updated.'
      redirect_to admin_group_event_path
    else
      flash[:error] = @group_event.errors.full_messages
      render template: "edit"
    end
  end

  def destroy
    @group_event = @group_event.find(params[:id])
    @group_event.destroy
    redirect_to(admin_group_event_path)
  end

private

  def group_event_params
    params.require(:group_event).permit(:name, :description, :state, :start_date, :end_date)
  end

end