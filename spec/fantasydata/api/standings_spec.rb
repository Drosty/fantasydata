require 'helper'

describe Fantasydata::API::Standings do

  before do
    @client = new_test_client
  end

  describe '#standings' do
    before do
      stub_get("/nfl/v2/JSON/Standings/2014").
      to_return(:body => fixture("standings/by_year.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.standings_by_year 2014
      expect(a_get("/nfl/v2/JSON/Standings/2014")).to have_been_made
    end

    it "returns player details" do
      standings = @client.standings_by_year 2014

      expect(standings).to be_an Array
      expect(standings.first.wins).to eq 12
      expect(standings.first.season).to eq 2014
    end
  end

end
