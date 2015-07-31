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


end


