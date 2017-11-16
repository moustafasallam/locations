module LocationsHelper

  def get_countries
    data = ISO3166::Country.all
    countries = Array.new

    data.each do |country|
      countries << [ country.name, country.alpha2 ]
    end
    return countries.unshift(['Select a country', ''])
  end

  def get_cities_for_country(country_alpha2)
    data = ISO3166::Country.find_country_by_alpha2(country_alpha2).states
    cities = Array.new

    data.each do |key, state|
      cities << [ state['name'], key ]
    end
    return cities
  end


end
