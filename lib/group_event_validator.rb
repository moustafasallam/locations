class GroupEventValidator

	def initialize(params)
		@params = params
		@valid = true
		@message = "OK"
		validate_name
		if @params[:state] == "published"
			validate_location
			validate_description
			validate_dates
		end
	end

	def is_valid?
		@valid
	end

	def message
		@message
	end

private

	def validate_name
		if @params[:name].blank?
			@valid = false
			@message = "can't have blank name for Event!"
		end
	end

	def validate_location
		if @valid == true && @params[:location].blank?
			@valid = false
			@message = "Location is required field for published events!"
		end
	end

	def validate_description
		if @valid == true && @params[:description].blank?
			@valid = false
			@message = "Description is required field for published events!"
		end
	end

	def validate_dates
		if @valid == true && (@params[:start_date].blank? || @params[:end_date].blank?)
			@valid = false
			@message = "Start date && end date must be provided!"
		end

		if @valid == true
			begin
				@params[:start_date] = @params[:start_date].to_date
				@params[:end_date] = @params[:end_date].to_date
			rescue => e
				@valid = false
				@message = e.message
			end
		end

		if @valid == true && (@params[:end_date] < @params[:start_date])
			@valid = false
			@message = "date range wrong, end date can't be less than start date"
		end

		if @valid == true && (@params[:start_date] < Time.now.to_date)
			@valid = false
			@message = "can't set start date in the past"
		end
	end

end