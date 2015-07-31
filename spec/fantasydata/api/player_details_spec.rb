require 'helper'

describe Fantasydata::API::Stadium do

  before do
    @client = new_test_client
  end

  describe '#player_details_available_spec' do
    before do
      stub_get("/nfl/v2/JSON/Players").
      to_return(:body => fixture("player_details/active.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource - pass string" do
      @client.player_details_available
      expect(a_get("/nfl/v2/JSON/Players")).to have_been_made
    end

    it "returns player details" do
      players = @client.player_details_available

      expect(players).to be_an Array
      expect(players.first.player_id).to eq 17065
    end
  end

  describe '#player_details_freeagents_spec' do
    before do
      stub_get("/nfl/v2/JSON/FreeAgents").
      to_return(:body => fixture("player_details/free_agents.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource - pass string" do
      @client.player_details_free_agents
      expect(a_get("/nfl/v2/JSON/FreeAgents")).to have_been_made
    end

    it "returns player details" do
      players = @client.player_details_free_agents

      expect(players).to be_an Array
      expect(players.first.player_id).to eq 3
    end
  end

  describe '#player_details_freeagents_spec' do
    before do
      stub_get("/nfl/v2/JSON/Player/7328").
      to_return(:body => fixture("player_details/player_find.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource - pass string" do
      @client.player_details_by_player_id(7328)
      expect(a_get("/nfl/v2/JSON/Player/7328")).to have_been_made
    end

    it "returns player details and related data" do
      player = @client.player_details_by_player_id(7328)

      expect(player).to be_an Fantasydata::PlayerDetail
      expect(player.player_id).to eq 7328

      expect(player.season_stats).to be_an Fantasydata::SeasonStats
      expect(player.season_stats.fumbles).to eq 5

      expect(player.season_stats.scoring_details).to be_an Array
      expect(player.season_stats.scoring_details.first.game_key).to eq '201410110'

      expect(player.latest_news).to be_an Array
      expect(player.latest_news.first.news_id).to eq 34904
    end
  end

  describe '#player_details_freeagents_spec' do
    before do
      stub_get("/nfl/v2/JSON/Players/MIN").
      to_return(:body => fixture("player_details/by_team.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource - pass string" do
      @client.player_details_by_team('MIN')
      expect(a_get("/nfl/v2/JSON/Players/MIN")).to have_been_made
    end

    it "returns player details and related data" do
      player = @client.player_details_by_team('MIN')

      expect(player).to be_an Array
      expect(player.first.player_id).to eq 11323

      expect(player.first.season_stats).to be_an Fantasydata::SeasonStats
      expect(player.first.season_stats.fumbles).to eq 0

      expect(player.first.season_stats.scoring_details).to be_an Array
      expect(player.first.season_stats.scoring_details.count).to eq 0

      expect(player.first.latest_news).to be_an Array
      expect(player.first.latest_news.first.news_id).to eq 5812
    end
  end

end
