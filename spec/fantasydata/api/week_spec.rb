require 'helper'

describe Fantasydata::API::DailyFantasy do

  before do
    @client = new_test_client
  end

  describe '#week_current' do
    before do
      stub_get("/nfl/v2/JSON/CurrentWeek").
      to_return(:body => fixture("week/current.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource - pass string" do
      @client.week_current
      expect(a_get("/nfl/v2/JSON/CurrentWeek")).to have_been_made
    end

    it "returns player details" do
      current_week = @client.week_current

      expect(current_week).to be_an Integer
      expect(current_week).to eq 16
    end
  end

end
