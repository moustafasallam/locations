module Api::V1
	class GroupEventsController < Api::BaseController
		skip_before_action :verify_authenticity_token

		def index
			@group_events = paginate GroupEvent.all
			success()
		end

		def show
			group_event = GroupEvent.where(id: params[:id]).first
			group_event.present? ? success() : error(404, "record no found!")
		end

		def create
			data = params[:group_event] || params
			validator = GroupEventValidator.new(data)
 			if validator.is_valid? == true
 				conductor = AmqpConductor.new
 				conductor.send(params.to_json)
				conductor.close
				success({}, "New Group Event has been queued successfully!")
			else
				error(500, validator.message)
 			end
		end

	end
end