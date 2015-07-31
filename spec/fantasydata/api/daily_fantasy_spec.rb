require 'helper'

describe Fantasydata::API::DailyFantasy do

  before do
    @client = new_test_client
  end

  describe '#daily_fantasy_players' do
    before do
      stub_get("/nfl/v2/JSON/DailyFantasyPlayers/2014-SEP-21").
      to_return(:body => fixture("daily_fantasy/daily_players.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource - pass string" do
      @client.daily_fantasy_players_for_day('2014-SEP-21')
      expect(a_get("/nfl/v2/JSON/DailyFantasyPlayers/2014-SEP-21")).to have_been_made
    end

    it "requests correct resource - pass date" do
      @client.daily_fantasy_players_for_day(DateTime.parse("2014/09/21"))
      expect(a_get("/nfl/v2/JSON/DailyFantasyPlayers/2014-SEP-21")).to have_been_made
    end

    it "returns players" do
      players = @client.daily_fantasy_players_for_day('2014-SEP-21')

      expect(players).to be_an Array
      expect(players.first.player_id).to eq 7328
      expect(players.first.date).to eq '2014-09-21T16:25:00'
      expect(players.first.short_name).to eq 'P.Manning'
      expect(players.first.name).to eq 'Peyton Manning'
      expect(players.first.team).to eq 'DEN'
      expect(players.first.opponent).to eq 'SEA'
      expect(players.first.position).to eq 'QB'
      expect(players.first.salary).to eq 9900
      expect(players.first.last_game_fantasy_points).to eq 10.44
      expect(players.first.projected_fantasy_points).to eq 17.32
      expect(players.first.opponent_rank).to eq 11
      expect(players.first.opponent_position_rank).to eq 16
      expect(players.first.status).to eq 'Healthy'
      expect(players.first.status_code).to eq 'ACT'
      expect(players.first.status_color).to eq 'green'
    end
  end

  describe '#daily_fantasy_results' do
    before do
      stub_get("/nfl/v2/JSON/DailyFantasyPoints/2014-SEP-21").
      to_return(:body => fixture("daily_fantasy/daily_points.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource - pass string" do
      @client.daily_fantasy_points_for_day('2014-SEP-21')
      expect(a_get("/nfl/v2/JSON/DailyFantasyPoints/2014-SEP-21")).to have_been_made
    end

    it "requests correct resource - pass date" do
      @client.daily_fantasy_points_for_day(DateTime.parse("2014/09/21"))
      expect(a_get("/nfl/v2/JSON/DailyFantasyPoints/2014-SEP-21")).to have_been_made
    end

    it "returns player data" do
      players = @client.daily_fantasy_points_for_day('2014-SEP-21')

      expect(players).to be_an Array
      expect(players.first.player_id).to eq 2593
      expect(players.first.name).to eq 'Aaron Rodgers'
      expect(players.first.fantasy_points).to eq 28.64
      expect(players.first.has_started).to eq true
      expect(players.first.is_in_progress).to eq false
      expect(players.first.is_over).to eq true
      expect(players.first.date).to eq nil
    end
  end

  describe '#daily_fantasy_defense_game_stats' do
    before do
      stub_get("/nfl/v2/JSON/FantasyDefenseByGame/2014/12").
      to_return(:body => fixture("daily_fantasy/daily_defense_game.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.daily_fantasy_defense_game_stats(12, 2014)
      expect(a_get("/nfl/v2/JSON/FantasyDefenseByGame/2014/12")).to have_been_made
    end

    it "returns player data" do
      defenses = @client.daily_fantasy_defense_game_stats(12, 2014)

      expect(defenses).to be_an Array
      expect(defenses.first.scoring_details).to be_an Array

      expect(defenses.first.team).to eq 'BAL'
      expect(defenses.first.scoring_details.first.game_key).to eq "201411222"
    end
  end

  describe '#daily_fantasy_defense_game_stats_projected' do
    before do
      stub_get("/nfl/v2/JSON/FantasyDefenseProjectionsByGame/2014/12").
      to_return(:body => fixture("daily_fantasy/defense_game_stats_projected.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.daily_fantasy_defense_game_projected_stats(12, 2014)
      expect(a_get("/nfl/v2/JSON/FantasyDefenseProjectionsByGame/2014/12")).to have_been_made
    end

    it "returns player data" do
      defenses = @client.daily_fantasy_defense_game_projected_stats(12, 2014)

      expect(defenses).to be_an Array
      expect(defenses.first.scoring_details).to be_an Array

      expect(defenses.first.team).to eq 'OAK'
    end
  end


end
