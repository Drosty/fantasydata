require 'helper'

describe Fantasydata::API::Score do

  before do
    @client = new_test_client
  end

  describe '#scores_by_season' do
    before do
      stub_get("/nfl/v2/JSON/Scores/2012").
      to_return(:body => fixture("scores/by_season.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.scores_by_season(2012)
      expect(a_get("/nfl/v2/JSON/Scores/2012")).to have_been_made
    end

    it "returns scores" do
      scores = @client.scores_by_season(2012)

      expect(scores).to be_an Array
      expect(scores.first).to be_an Fantasydata::Score
      expect(scores.first.game_key).to eq '201210123'
      expect(scores.first.away_score_quarter3).to eq 10
    end
  end

  describe '#scores_by_week' do
    before do
      stub_get("/nfl/v2/JSON/ScoresByWeek/2012/11").
      to_return(:body => fixture("scores/by_week.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.scores_by_week(2012, 11)
      expect(a_get("/nfl/v2/JSON/ScoresByWeek/2012/11")).to have_been_made
    end

    it "returns scores" do
      scores = @client.scores_by_week(2012, 11)

      expect(scores).to be_an Array
      expect(scores.first).to be_an Fantasydata::Score
      expect(scores.first.game_key).to eq '201211104'
      expect(scores.first.away_score_quarter3).to eq 0
    end
  end

end
