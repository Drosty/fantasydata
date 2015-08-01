require 'helper'

describe Fantasydata::API::PlayerStat do

  before do
    @client = new_test_client
  end

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

  describe '#player_game_stat_by_week_and_team' do
    before do
      stub_get("/nfl/v2/JSON/PlayerGameStatsByTeam/2014/12/MIN").
      to_return(:body => fixture("player_stat/stat_by_week_and_team.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_game_stat_by_week_and_team(2014, 12, 'MIN')
      expect(a_get("/nfl/v2/JSON/PlayerGameStatsByTeam/2014/12/MIN")).to have_been_made
    end

    it "returns player details" do
      stat = @client.player_game_stat_by_week_and_team(2014, 12, 'MIN')

      expect(stat).to be_an Array
      expect(stat.first).to be_an Fantasydata::PlayerGameStat
      expect(stat.first.player_id).to eq 14463
    end
  end

  describe '#player_game_stat_by_week_and_team_projection' do
    before do
      stub_get("/nfl/v2/JSON/PlayerGameProjectionStatsByTeam/2014/12/MIN").
      to_return(:body => fixture("player_stat/stat_by_week_and_team_projected.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.player_game_stat_by_week_and_team_projection(2014, 12, 'MIN')
      expect(a_get("/nfl/v2/JSON/PlayerGameProjectionStatsByTeam/2014/12/MIN")).to have_been_made
    end

    it "returns player details" do
      stat = @client.player_game_stat_by_week_and_team_projection(2014, 12, 'MIN')

      expect(stat).to be_an Array
      expect(stat.first).to be_an Fantasydata::PlayerGameStat
      expect(stat.first.player_id).to eq 14463
      expect(stat.first.field_goals_attempted).to eq 2
    end
  end

end
