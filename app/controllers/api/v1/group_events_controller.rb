module Api::V1
	class GroupEventsController < Api::BaseController



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
 			end
			conductor.close
			success({}, "New Group Event has been queued successfully!")
		end

	end
end