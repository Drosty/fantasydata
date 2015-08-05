require 'helper'

describe Fantasydata::API::LeagueLeaders do

  before do
    @client = new_test_client
  end

  describe '#league_leaders_by_season' do
    before do
      stub_get("/nfl/v2/JSON/SeasonLeagueLeaders/2014/OFFENSE/FantasyPoints").
      to_return(:body => fixture("league_leaders/by_season.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.league_leaders_by_season(2014, 'offense', 'FantasyPoints')
      expect(a_get("/nfl/v2/JSON/SeasonLeagueLeaders/2014/OFFENSE/FantasyPoints")).to have_been_made
    end

    it "returns league leaders" do
      leaders = @client.league_leaders_by_season(2014, 'offense', 'FantasyPoints')
      expect(leaders).to be_an Array
      expect(leaders.first).to be_an Fantasydata::PlayerSeasonStat
      expect(leaders.first.player_id).to eq 2593
    end
  end

end
