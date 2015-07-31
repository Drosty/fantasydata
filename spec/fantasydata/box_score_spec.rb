require 'helper'

describe Fantasydata do

  after do
    Fantasydata.reset!
  end

  context "when delegating to a client" do

    before do
      Fantasydata.configure do |config|
        config.api_key = 'AK'
      end

      stub_get("/nfl/v2/JSON/AreAnyGamesInProgress").
        to_return(:body => fixture("game/in_progress.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      #Fantasydata.games_in_progress(:artist => 'radiohead')
      #expect(a_get("/api/v4/song/search")
      #.with(:query => {:artist => 'radiohead'}))
      #.to have_been_made
    end

    it "returns the same results as a client" do
      expect(Fantasydata.games_in_progress?).to eq Fantasydata::Client.new.games_in_progress?
    end

    describe ".respond_to?" do
      it "delegates to Fantasydata::Client" do
        expect(Fantasydata.respond_to?(:games_in_progress?)).to be_truthy
      end
      it "takes an optional argument" do
        expect(Fantasydata.respond_to?(:client, true)).to be_truthy
      end
    end

    describe ".client" do
      it "returns a Fantasydata::Client" do
        expect(Fantasydata.client).to be_a Fantasydata::Client
      end

      context "when the options don't change" do
        it "caches the client" do
          expect(Fantasydata.client).to eq Fantasydata.client
        end
      end

      context "when the options change" do
        it "busts the cache" do
          client1 = Fantasydata.client
          Fantasydata.configure do |config|
            config.api_key = 'abc'
          end
          client2 = Fantasydata.client
          expect(client1).not_to eq client2
        end
      end
    end
  end
end