require 'elasticsearch/model'
class GroupEvent < ActiveRecord::Base
	include ActiveModel::Transitions
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def as_indexed_json(options={})
    as_json(only: [:id, :city_name, :weather_title, :weather_description, :country_code])
  end

end