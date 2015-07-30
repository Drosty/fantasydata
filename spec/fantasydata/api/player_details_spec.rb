require 'helper'

describe Fantasydata::API::DailyFantasy do

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

end
