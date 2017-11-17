class OpenWeather
  include HTTParty
  debug_output

  base_uri "http://api.openweathermap.org/data/2.5/"
  default_params appid: "21528a38986f5d84ab48ee1793a7fddd"

  def initialize(params)
    @country_code = params[:country_code]
    @city_name = params[:city_name]
    @response = {}
  end

  def get_by_name(entity)
    @response = self.class.get(entity, query: {q: "#{@city_name},#{@country_code}"}).parsed_response
  rescue => e
    @response = e
  end

  def get_by_id(entity, city_id)
    @response = self.class.get(entity, query: {id: city_id}).parsed_response
  rescue => e
    @response = e
  end

  def get_response
    @response
  end

  #"{\"cod\":\"404\",\"message\":\"city not found\"}"
  #"{\"coord\":{\"lon\":31.25,\"lat\":30.06},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"base\":\"stations\",
  #\"main\":{\"temp\":292.15,\"pressure\":1015,\"humidity\":93,\"temp_min\":292.15,\"temp_max\":292.15},\"visibility\":6000,\"wind\":{\"speed\":4.1,\"deg\":50},\"clouds\":{\"all\":0},\"dt\":1510873200,\"sys\":{\"type\":1,\"id\":6392,\"message\":0.0033,\"country\":\"EG\",\"sunrise\":1510806106,\"sunset\":1510844271},\"id\":360630,\"name\":\"Cairo\",\"cod\":200}"

  def is_successful
    r = false
    if @response.is_a?(Hash) && @response.has_key?('cod') && @response['cod'] == 200
      r = true
    end
    return r
  end

end