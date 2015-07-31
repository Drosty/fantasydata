require 'helper'

describe Fantasydata::API::DailyFantasy do

  before do
    @client = new_test_client
  end

  describe '#stadiums' do
    before do
      stub_get("/nfl/v2/JSON/Stadiums").
      to_return(:body => fixture("stadium/index.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.stadiums
      expect(a_get("/nfl/v2/JSON/Stadiums")).to have_been_made
    end

    it "returns player details" do
      stadiums = @client.stadiums

      expect(stadiums).to be_an Array
      expect(stadiums.first.stadium_id).to eq 1
      expect(stadiums.first.capacity).to eq 73079
    end
  end

end


