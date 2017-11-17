require 'rails_helper'

RSpec.describe LocationsController , type: :controller do

  describe "GET #index" do
    subject { get :index }

    it "renders successfully" do
      expect(subject.status).to eq(200)
      expect(subject.content_type).to eq "text/html"
    end
  end


  describe "POST #create" do
    before do
      post :create, { :city_name => 'Cairo', :country_code => 'EG' }
    end

    it "has a 200 status code" do
      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
      body = JSON.parse(response.body)
      expect(body['payload']['city_name']).to eq "Cairo"
    end

  end


end