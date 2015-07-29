require 'helper'

describe Fantasydata::API::ByeWeeks do

  before do
    @client = new_test_client
  end

  describe '#bye_weeks_season' do
    before do
      stub_get("/nfl/v2/JSON/Byes/2015REG").
      to_return(:body => fixture("bye_weeks/bye_weeks.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      bye_weeks = @client.bye_weeks_for_season('2015REG')
      expect(a_get("/nfl/v2/JSON/Byes/2015REG")).to have_been_made
    end

    it "returns byeweeks" do
      byeweeks = @client.bye_weeks_for_season('2015REG')
      expect(byeweeks).to be_an Array
      expect(byeweeks.first.season).to eq 2015
      expect(byeweeks.first.week).to eq 4
      expect(byeweeks.first.team).to eq 'NE'
    end

  end

end
