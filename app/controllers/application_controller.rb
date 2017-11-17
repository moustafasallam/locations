class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def error(status = 500, message="Server Error")
    render json: {success: false, code: status, message: message, payload: {}}, status: status and return
  end

  def success(data=nil, message="SUCCESS")
    data = JSON.parse render_to_string if data.nil?
    render json: {success: true, code: 200 , message: message, payload: data}, status: '200' and return
  end
end
