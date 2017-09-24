require 'rails_helper'

RSpec.describe GroupEvent, type: :model do

  let(:group_event)        {build(:group_event)}

  describe "GroupEvent" do

    it "after create expect bug number to be incremental" do
      expect(group_event.state).to eq("draft")
    end

  end

end