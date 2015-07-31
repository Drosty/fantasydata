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

end
