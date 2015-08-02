require 'helper'

describe Fantasydata::API::PlayerStat do

  before do
    @client = new_test_client
  end

  ######################
  #
  # PLAYER GAME STATS
  #
  ######################


  describe '#player_game_stat_by_player' do
    before do
      stub_get("/nfl/v2/JSON/PlayerGameStatsByPlayerID/2014/12/7328").
      to_return(:body => fixture("player_stat/stat_by_player_id.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_game_stat_by_player(2014, 12, 7328)
      expect(a_get("/nfl/v2/JSON/PlayerGameStatsByPlayerID/2014/12/7328")).to have_been_made
    end

    it "returns player details" do
      stat = @client.player_game_stat_by_player(2014, 12, 7328)

      expect(stat).to be_an Fantasydata::PlayerGameStat
      expect(stat.player_id).to eq 7328
      expect(stat.scoring_details).to be_an Array
      expect(stat.scoring_details.first.game_key).to eq '201411210'
    end
  end

  describe '#player_stat_by_week_projected' do
    before do
      stub_get("/nfl/v2/JSON/PlayerGameProjectionStatsByPlayerID/2014/12/7328").
      to_return(:body => fixture("player_stat/stat_by_game_projection.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_game_stat_by_player_projection(2014, 12, 7328)
      expect(a_get("/nfl/v2/JSON/PlayerGameProjectionStatsByPlayerID/2014/12/7328")).to have_been_made
    end

    it "returns player details" do
      stat = @client.player_game_stat_by_player_projection(2014, 12, 7328)

      expect(stat).to be_an Fantasydata::PlayerGameStat
      expect(stat.player_id).to eq 7328
    end
  end

  describe '#player_game_stats_by_week_and_team' do
    before do
      stub_get("/nfl/v2/JSON/PlayerGameStatsByTeam/2014/12/MIN").
      to_return(:body => fixture("player_stat/stat_by_week_and_team.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_game_stats_by_week_and_team(2014, 12, 'MIN')
      expect(a_get("/nfl/v2/JSON/PlayerGameStatsByTeam/2014/12/MIN")).to have_been_made
    end

    it "returns player details" do
      stat = @client.player_game_stats_by_week_and_team(2014, 12, 'MIN')

      expect(stat).to be_an Array
      expect(stat.first).to be_an Fantasydata::PlayerGameStat
      expect(stat.first.player_id).to eq 14463
    end
  end

  describe '#player_game_stats_by_week_and_team_projection' do
    before do
      stub_get("/nfl/v2/JSON/PlayerGameProjectionStatsByTeam/2014/12/MIN").
      to_return(:body => fixture("player_stat/stat_by_week_and_team_projected.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_game_stats_by_week_and_team_projection(2014, 12, 'MIN')
      expect(a_get("/nfl/v2/JSON/PlayerGameProjectionStatsByTeam/2014/12/MIN")).to have_been_made
    end

    it "returns player details" do
      stat = @client.player_game_stats_by_week_and_team_projection(2014, 12, 'MIN')

      expect(stat).to be_an Array
      expect(stat.first).to be_an Fantasydata::PlayerGameStat
      expect(stat.first.player_id).to eq 14463
      expect(stat.first.field_goals_attempted).to eq 2
    end
  end

  describe '#player_game_stats_by_week' do
    before do
      stub_get("/nfl/v2/JSON/PlayerGameStatsByWeek/2014/13").
      to_return(:body => fixture("player_stat/stat_by_week.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_game_stats_by_week(2014, 13)
      expect(a_get("/nfl/v2/JSON/PlayerGameStatsByWeek/2014/13")).to have_been_made
    end

    it "returns player details" do
      stat = @client.player_game_stats_by_week(2014, 13)

      expect(stat).to be_an Array
      expect(stat.first).to be_an Fantasydata::PlayerGameStat
      expect(stat.first.player_id).to eq 7295
      expect(stat.first.stadium).to eq "Lucas Oil Stadium"
    end
  end

  describe '#player_game_stat_by_delta' do
    before do
      stub_get("/nfl/v2/JSON/PlayerGameStatsDelta/4").
      to_return(:body => fixture("player_stat/stat_by_delta.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_game_stats_by_delta(4)
      expect(a_get("/nfl/v2/JSON/PlayerGameStatsDelta/4")).to have_been_made
    end

    it "returns player details" do
      stat = @client.player_game_stats_by_delta(4)

      expect(stat).to be_an Array
      expect(stat.first).to be_an Fantasydata::PlayerGameStat
      expect(stat.first.player_id).to eq 7295
      expect(stat.first.stadium).to eq "Lucas Oil Stadium"
    end
  end

  ######################
  #
  # PLAYER SEASON STATS
  #
  ######################

  describe '#player_season_stats_by_year_projection' do
    before do
      stub_get("/nfl/v2/JSON/PlayerSeasonProjectionStats/2014").
      to_return(:body => fixture("player_stat/season_stat_by_season_projection.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_season_stats_by_year_projection(2014)
      expect(a_get("/nfl/v2/JSON/PlayerSeasonProjectionStats/2014")).to have_been_made
    end

    it "returns player details" do
      stats = @client.player_season_stats_by_year_projection(2014)

      expect(stats).to be_an Array
      expect(stats.first).to be_an Fantasydata::PlayerSeasonStat
      expect(stats.first.player_id).to eq 2428
      expect(stats.first.player_season_id).to eq 0
    end
  end

  describe '#player_season_stat_by_player_id' do
    before do
      stub_get("/nfl/v2/JSON/PlayerSeasonStatsByPlayerID/2014/2428").
      to_return(:body => fixture("player_stat/season_stat_by_player_id.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_season_stat_by_player_id(2014, 2428)
      expect(a_get("/nfl/v2/JSON/PlayerSeasonStatsByPlayerID/2014/2428")).to have_been_made
    end

    it "returns player details" do
      stats = @client.player_season_stat_by_player_id(2014, 2428)

      expect(stats).to be_an Fantasydata::PlayerSeasonStat
      expect(stats.player_id).to eq 2428
      expect(stats.player_season_id).to eq 14247797
    end
  end

  describe '#player_season_stat_by_player_id_projection' do
    before do
      stub_get("/nfl/v2/JSON/PlayerSeasonProjectionStatsByPlayerID/2014/2429").
      to_return(:body => fixture("player_stat/season_stat_by_player_id_projection.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_season_stat_by_player_id_projection(2014, 2429)
      expect(a_get("/nfl/v2/JSON/PlayerSeasonProjectionStatsByPlayerID/2014/2429")).to have_been_made
    end

    it "returns player details" do
      stats = @client.player_season_stat_by_player_id_projection(2014, 2429)

      expect(stats).to be_an Fantasydata::PlayerSeasonStat
      expect(stats.player_id).to eq 2429
      expect(stats.player_season_id).to eq 0
    end
  end

  describe '#player_season_stat_by_team' do
    before do
      stub_get("/nfl/v2/JSON/PlayerSeasonStatsByTeam/2014/MIN").
      to_return(:body => fixture("player_stat/season_stat_by_team.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_season_stat_by_team(2014, 'MIN')
      expect(a_get("/nfl/v2/JSON/PlayerSeasonStatsByTeam/2014/MIN")).to have_been_made
    end

    it "returns player details" do
      stats = @client.player_season_stat_by_team(2014, 'MIN')

      expect(stats).to be_an Array
      expect(stats.first).to be_an Fantasydata::PlayerSeasonStat
      expect(stats.first.player_id).to eq 14463
      expect(stats.first.player_season_id).to eq 14248877
    end
  end

end
