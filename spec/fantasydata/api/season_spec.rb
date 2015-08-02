require 'helper'

describe Fantasydata::API::Season do

  before do
    @client = new_test_client
  end

  describe '#season_current' do
    before do
      stub_get("/nfl/v2/JSON/CurrentSeason").
      to_return(:body => fixture("season/current.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.current_season
      expect(a_get("/nfl/v2/JSON/CurrentSeason")).to have_been_made
    end

    it "returns current season" do
      current_season = @client.current_season

      expect(current_season).to be_an Integer
      expect(current_season).to eq 2015
    end
  end

  describe '#season_last_completed' do
    before do
      stub_get("/nfl/v2/JSON/LastCompletedSeason").
      to_return(:body => fixture("season/last_completed.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.last_completed_season
      expect(a_get("/nfl/v2/JSON/LastCompletedSeason")).to have_been_made
    end

    it "returns last completed season" do
      season = @client.last_completed_season

      expect(season).to be_an Integer
      expect(season).to eq 2014
    end
  end

  describe '#season_upcoming' do
    before do
      stub_get("/nfl/v2/JSON/UpcomingSeason").
      to_return(:body => fixture("season/upcoming.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.upcoming_season
      expect(a_get("/nfl/v2/JSON/UpcomingSeason")).to have_been_made
    end

    it "returns upcoming season" do
      season = @client.upcoming_season

      expect(season).to be_an Integer
      expect(season).to eq 2015
    end
  end

end
