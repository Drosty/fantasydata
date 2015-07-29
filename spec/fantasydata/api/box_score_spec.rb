require 'helper'

describe Fantasydata::API::BoxScore do

  before do
    @client = new_test_client
  end

  describe '#artist_biographies' do
    before do
      stub_get("/api/v4/artist/biographies").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/biographies.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_biographies(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/biographies").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns biographies" do
      biographies = @client.artist_biographies(:id => 'ARH6W4X1187B99274F')
      expect(biographies).to be_an Array
      expect(biographies.first.site).to eq 'last.fm'
      expect(biographies.first.license.attribution).to eq 'Last.fm'
    end
  end

end
