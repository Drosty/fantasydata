require 'helper'

describe Fantasydata::API::Injury do

  before do
    @client = new_test_client
  end

  describe '#injuries_by_year_and_week' do
    before do
      stub_get("/nfl/v2/JSON/Injuries/2014/5").
      to_return(:body => fixture("injury/by_year_and_week.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.injuries_by_year_and_week(2014, 5)
      expect(a_get("/nfl/v2/JSON/Injuries/2014/5")).to have_been_made
    end

    it "returns injuries" do
      injuries = @client.injuries_by_year_and_week(2014, 5)

      expect(injuries).to be_an Array
      expect(injuries.first).to be_an Fantasydata::Injury
      expect(injuries.first.injury_id).to eq 31066
      expect(injuries.first.player_id).to eq 13406
    end
  end

  describe '#injuries_by_year_week_team' do
    before do
      stub_get("/nfl/v2/JSON/Injuries/2014/5/MIN").
      to_return(:body => fixture("injury/by_team.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.injuries_by_year_week_team(2014, 5, 'MIN')
      expect(a_get("/nfl/v2/JSON/Injuries/2014/5/MIN")).to have_been_made
    end

    it "returns injuries" do
      injuries = @client.injuries_by_year_week_team(2014, 5, 'MIN')

      expect(injuries).to be_an Array
      expect(injuries.first).to be_an Fantasydata::Injury
      expect(injuries.first.injury_id).to eq 31739
      expect(injuries.first.player_id).to eq 14461
    end
  end


end
