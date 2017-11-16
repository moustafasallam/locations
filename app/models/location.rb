require 'elasticsearch/model'

class GroupEvent < ActiveRecord::Base
	include ActiveModel::Transitions
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  acts_as_paranoid

	state_machine do
    state :draft
    state :published

    event :publish do
      transitions :to => :publish, :from => :draft
    end
  end

  geocoded_by :location
  after_validation :geocode


  def self.states
    ['draft', 'published']
  end

  def as_indexed_json(options={})
    as_json(only: [:id, :name, :description, :state, :start_date, :end_date, :location])
  end

end