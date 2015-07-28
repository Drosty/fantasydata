require 'helper'

describe Fantasydata::Error do
  before do
    @client = new_test_client
  end

  describe "#initialize" do
    it "wraps another error class" do
      begin
        raise Faraday::Error::ClientError.new("Oops")
      rescue Faraday::Error::ClientError
        begin
          raise Fantasydata::Error
        rescue Fantasydata::Error => error
          expect(error.message).to eq "Oops"
          expect(error.wrapped_exception.class).to eq Faraday::Error::ClientError
        end
      end
    end
  end

  describe "#from_response" do

    before do
      stub_get("/nfl/v2/JSON/AreAnyGamesInProgress").
        to_return(:status => 401,
                  :body => fixture('error_response.json'))
    end

    it "should return Fantasydata badrequest when 401 is returned" do
      expect{@client.games_in_progress}.to raise_error(Fantasydata::Error::Unauthorized)
    end

  end

end