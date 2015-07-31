require 'helper'

describe Fantasydata::API::Game do

  before do
    @client = new_test_client
  end

  describe '#in_progress_false' do
    before do
      stub_get("/nfl/v2/JSON/AreAnyGamesInProgress").
      to_return(:body => fixture("game/in_progress_false.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.games_in_progress?
      expect(a_get("/nfl/v2/JSON/AreAnyGamesInProgress")).to have_been_made
    end

    it "returns false" do
      in_progress = @client.games_in_progress?
      expect(in_progress).to eq false
    end
  end

  describe '#in_progress_true' do
    before do
      stub_get("/nfl/v2/JSON/AreAnyGamesInProgress").
      to_return(:body => fixture("game/in_progress_true.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "returns true" do
      in_progress = @client.games_in_progress?
      expect(in_progress).to eq true
    end
  end

  describe '#game_stats_by_week' do
    before do
      stub_get("/nfl/v2/JSON/GameStatsByWeek/2014/12").
      to_return(:body => fixture("game/game_stats_by_week.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.game_stats_by_week(2014, 12)
      expect(a_get("/nfl/v2/JSON/GameStatsByWeek/2014/12")).to have_been_made
    end

    it "returns game stats" do
      game_stats = @client.game_stats_by_week(2014, 12)
      expect(game_stats).to be_an Array
      expect(game_stats.first.game_key).to eq '201411225'
      expect(game_stats.first.home_punt_net_yards).to eq 245
      expect(game_stats.first.stadium).to be_an Fantasydata::Stadium
      expect(game_stats.first.stadium.stadium_id).to eq 16
    end
  end

end
