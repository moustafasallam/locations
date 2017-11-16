module LocationsHelper

  def get_countries
    data = ISO3166::Country.all
    countries = Array.new

    data.each do |country|
      countries << [ country.name, country.alpha2 ]
    end
    return countries.unshift(['Select a country', ''])
  end

end
