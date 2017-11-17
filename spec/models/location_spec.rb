require 'rails_helper'

RSpec.describe Location, type: :model do

  describe "Location" do

    let(:location)        {build(:location)}
    let(:data)        {build(:api_sample)}

    it "location is valid" do
      expect(location).to be_valid
    end

    it "location is not valid" do
      location.city_name = nil
      expect(location).not_to be_valid
    end

    it "passing correct data structure coming from the weather api" do
      result = Location.prepare_data(data[:basic])
      expect(result['city_name']).to eq('London')
      expect(result['country_code']).to eq('GB')
    end

    it "passing empty data structure coming from the weather api" do
      expect(Location.prepare_data({})).to  eq({})
    end
  end

end