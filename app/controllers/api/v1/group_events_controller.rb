module Api::V1
	class GroupEventController < Api::BaseController

		def index

		end

		def show
			@group_event = GroupEvent.where(id: params[:id]).first
			@group_event.present? ? success() : error(404, "record no found!")
		end

	end
end