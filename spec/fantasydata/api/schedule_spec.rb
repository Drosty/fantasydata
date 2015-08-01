require 'helper'

describe Fantasydata::API::Schedule do

  before do
    @client = new_test_client
  end

  describe '#schedule_by_year' do
    before do
      stub_get("/nfl/v2/JSON/Schedules/2014").
      to_return(:body => fixture("schedule/for_year.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.schedule_by_year(2014)
      expect(a_get("/nfl/v2/JSON/Schedules/2014")).to have_been_made
    end

    it "returns player details" do
      schedule_items = @client.schedule_by_year(2014)

      expect(schedule_items).to be_an Array
      expect(schedule_items.first).to be_an Fantasydata::Schedule

      expect(schedule_items.first.game_key).to eq "201410130"
      expect(schedule_items.first.season).to eq 2014

      expect(schedule_items.first.stadium).to be_an Fantasydata::Stadium
      expect(schedule_items.first.stadium.name).to eq "CenturyLink Field"
    end
  end

end


