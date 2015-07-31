require 'helper'

describe Fantasydata::API::Game do

  before do
    @client = new_test_client
  end

  describe '#news_by_player_id' do
    before do
      stub_get("/nfl/v2/XML/NewsByPlayerID/1326").
      to_return(:body => fixture("news/by_player.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.news_by_player_id(1326)
      expect(a_get("/nfl/v2/XML/NewsByPlayerID/1326")).to have_been_made
    end

    it "returns returns news" do
      news = @client.news_by_player_id(1326)
      expect(news).to be_an Array
      expect(news.first.news_id).to eq 36084
    end
  end

  describe '#news_by_team' do
    before do
      stub_get("/nfl/v2/JSON/NewsByTeam/MIN").
      to_return(:body => fixture("news/by_team.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.news_by_team('MIN')
      expect(a_get("/nfl/v2/JSON/NewsByTeam/MIN")).to have_been_made
    end

    it "returns returns news" do
      news = @client.news_by_team('MIN')
      expect(news).to be_an Array
      expect(news.first.news_id).to eq 35043
    end
  end


end
