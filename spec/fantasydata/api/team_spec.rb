require 'helper'

describe Fantasydata::API::Team do

  before do
    @client = new_test_client
  end

  describe '#teams_active' do
    before do
      stub_get("/nfl/v2/JSON/Teams").
      to_return(:body => fixture("team/active.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.teams_active
      expect(a_get("/nfl/v2/JSON/Teams")).to have_been_made
    end

    it "returns active teams" do
      teams = @client.teams_active

      expect(teams).to be_an Array
      expect(teams.first.stadium.stadium_id).to eq 29
      expect(teams.first.key).to eq 'ARI'
      expect(teams.first.full_name).to eq 'Arizona Cardinals'
    end
  end

  describe '#teams_by_year' do
    before do
      stub_get("/nfl/v2/JSON/Teams/2012").
      to_return(:body => fixture("team/by_year.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.teams_by_year '2012'
      expect(a_get("/nfl/v2/JSON/Teams/2012")).to have_been_made
    end

    it "returns active teams" do
      teams = @client.teams_by_year '2012'

      expect(teams).to be_an Array
      expect(teams.first.stadium.stadium_id).to eq 7
      expect(teams.first.key).to eq 'BAL'
    end
  end

  describe '#teams_stats_by_year_and_week' do
    before do
      stub_get("/nfl/v2/JSON/TeamGameStats/2014/1").
      to_return(:body => fixture("team/week_stats.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.team_game_stats_by_year_and_week(2014, 1)
      expect(a_get("/nfl/v2/JSON/TeamGameStats/2014/1")).to have_been_made
    end

    it "returns active teams" do
      teams = @client.team_game_stats_by_year_and_week(2014, 1)

      expect(teams).to be_an Array
      expect(teams.first).to be_an Fantasydata::TeamGameStat
      expect(teams.first.day_of_week).to eq 'Monday'
      expect(teams.first.punt_net_yards).to eq 129
      expect(teams.first.game_key).to eq '201410101'
    end
  end

  describe '#teams_stats_by_season' do
    before do
      stub_get("/nfl/v2/JSON/TeamSeasonStats/2012").
      to_return(:body => fixture("team/season_stats.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.team_game_stats_by_season(2012)
      expect(a_get("/nfl/v2/JSON/TeamSeasonStats/2012")).to have_been_made
    end

    it "returns active teams" do
      teams = @client.team_game_stats_by_season(2012)

      expect(teams).to be_an Array
      expect(teams.first).to be_an Fantasydata::TeamSeasonStat
      expect(teams.first.penalties).to eq 102
      expect(teams.first.punt_net_yards).to eq 4634
    end
  end

end
