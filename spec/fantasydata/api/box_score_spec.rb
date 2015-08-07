require 'helper'

describe Fantasydata::API::BoxScore do

  before do
    @client = new_test_client
  end

  describe '#box_score_by_team' do
    before do
      stub_get("/nfl/v2/JSON/BoxScore/2012/12/MIN").
      to_return(:body => fixture("box_score/by_team.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.box_score_by_team(2012, 12, 'MIN')
      expect(a_get("/nfl/v2/JSON/BoxScore/2012/12/MIN")).to have_been_made
    end

    it "returns byeweeks" do
      box_score = @client.box_score_by_team(2012, 12, 'MIN')

      expect(box_score).to be_an Fantasydata::BoxScore

      expect(box_score.away_defense).to be_an Array
      expect(box_score.away_defense.first).to be_an Fantasydata::Boxscore::PlayerDefenseStat
      expect(box_score.away_defense.first.player_game_id).to eq 5922976

      expect(box_score.away_fantasy_defense).to be_an Fantasydata::Boxscore::TeamDefenseStat
      expect(box_score.away_fantasy_defense.game_key).to eq '201211206'

      expect(box_score.away_kick_punt_returns).to be_an Array
      expect(box_score.away_kick_punt_returns.first).to be_an Fantasydata::Boxscore::ReturnStat
      expect(box_score.away_kick_punt_returns.first.player_game_id).to eq 5922989

      expect(box_score.away_kicking).to be_an Array
      expect(box_score.away_kicking.first).to be_an Fantasydata::Boxscore::KickingStat
      expect(box_score.away_kicking.first.player_game_id).to eq 5922907

      expect(box_score.away_passing).to be_an Array
      expect(box_score.away_passing.first).to be_an Fantasydata::Boxscore::PassingStat
      expect(box_score.away_passing.first.player_game_id).to eq 5922968

      expect(box_score.away_punting).to be_an Array
      expect(box_score.away_punting.first).to be_an Fantasydata::Boxscore::PuntingStat
      expect(box_score.away_punting.first.player_game_id).to eq 5922982

      expect(box_score.away_receiving).to be_an Array
      expect(box_score.away_receiving.first).to be_an Fantasydata::Boxscore::ReceivingStat
      expect(box_score.away_receiving.first.player_game_id).to eq 5922966

      expect(box_score.away_rushing).to be_an Array
      expect(box_score.away_rushing.first).to be_an Fantasydata::Boxscore::RushingStat
      expect(box_score.away_rushing.first.player_game_id).to eq 5922970

      expect(box_score.game).to be_an Fantasydata::Boxscore::GameInformation
      expect(box_score.game.game_key).to eq '201211206'

      expect(box_score.home_defense).to be_an Array
      expect(box_score.home_defense.first).to be_an Fantasydata::Boxscore::PlayerDefenseStat
      expect(box_score.home_defense.first.player_game_id).to eq 5922923

      expect(box_score.home_fantasy_defense).to be_an Fantasydata::Boxscore::TeamDefenseStat
      expect(box_score.home_fantasy_defense.game_key).to eq '201211206'

      expect(box_score.home_kick_punt_returns).to be_an Array
      expect(box_score.home_kick_punt_returns.first).to be_an Fantasydata::Boxscore::ReturnStat
      expect(box_score.home_kick_punt_returns.first.player_game_id).to eq 5922931

      expect(box_score.home_kicking).to be_an Array
      expect(box_score.home_kicking.first).to be_an Fantasydata::Boxscore::KickingStat
      expect(box_score.home_kicking.first.player_game_id).to eq 5922906

      expect(box_score.home_passing).to be_an Array
      expect(box_score.home_passing.first).to be_an Fantasydata::Boxscore::PassingStat
      expect(box_score.home_passing.first.player_game_id).to eq 5922916

      expect(box_score.home_punting).to be_an Array
      expect(box_score.home_punting.first).to be_an Fantasydata::Boxscore::PuntingStat
      expect(box_score.home_punting.first.player_game_id).to eq 5922930

      expect(box_score.home_receiving).to be_an Array
      expect(box_score.home_receiving.first).to be_an Fantasydata::Boxscore::ReceivingStat
      expect(box_score.home_receiving.first.player_game_id).to eq 5922908

      expect(box_score.home_rushing).to be_an Array
      expect(box_score.home_rushing.first).to be_an Fantasydata::Boxscore::RushingStat
      expect(box_score.home_rushing.first.player_game_id).to eq 5922937

      expect(box_score.score).to be_an Fantasydata::Boxscore::Score
      expect(box_score.score.game_key).to eq '201211206'

      expect(box_score.scoring_details).to be_an Array
      expect(box_score.scoring_details.first).to be_an Fantasydata::ScoringDetail
      expect(box_score.scoring_details.first.player_game_id).to eq 5922907

      expect(box_score.scoring_plays).to be_an Array
      expect(box_score.scoring_plays.first).to be_an Fantasydata::Boxscore::ScoringPlay
      expect(box_score.scoring_plays.first.game_key).to eq '201211206'
    end
  end

  describe '#box_score_by_week' do
    before do
      stub_get("/nfl/v2/JSON/BoxScores/2012/7").
      to_return(:body => fixture("box_score/by_week.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.box_scores_by_week(2012, 7)
      expect(a_get("/nfl/v2/JSON/BoxScores/2012/7")).to have_been_made
    end

    it "returns byeweeks" do
      box_scores = @client.box_scores_by_week(2012, 7)

      expect(box_scores).to be_an Array

      expect(box_scores.count).to eq 3
      expect(box_scores.first).to be_an Fantasydata::BoxScore
      expect(box_scores.first.away_defense).to be_an Array
      expect(box_scores.first.away_defense.first).to be_an Fantasydata::Boxscore::PlayerDefenseStat
      expect(box_scores.first.away_defense.first.player_game_id).to eq 5915351
    end
  end
  
  describe '#box_score_by_week' do
    before do
      stub_get("/nfl/v2/JSON/ActiveBoxScores").
      to_return(:body => fixture("box_score/active.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.box_scores_active
      expect(a_get("/nfl/v2/JSON/ActiveBoxScores")).to have_been_made
    end

    it "returns byeweeks" do
      box_scores = @client.box_scores_active

      expect(box_scores).to be_an Array

      expect(box_scores.count).to eq 3
      expect(box_scores.first).to be_an Fantasydata::BoxScore
      expect(box_scores.first.away_defense).to be_an Array
      expect(box_scores.first.away_defense.first).to be_an Fantasydata::Boxscore::PlayerDefenseStat
      expect(box_scores.first.away_defense.first.player_game_id).to eq 5915351
    end
  end

  describe '#box_scores_delta' do
    before do
      stub_get("/nfl/v2/JSON/BoxScoresDelta/2014/12/1").
      to_return(:body => fixture("box_score/delta.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.box_scores_delta(2014, 12, 1)
      expect(a_get("/nfl/v2/JSON/BoxScoresDelta/2014/12/1")).to have_been_made
    end

    it "returns byeweeks" do
      box_scores = @client.box_scores_delta(2014, 12, 1)

      expect(box_scores).to be_an Array

      expect(box_scores.count).to eq 2
      expect(box_scores.first).to be_an Fantasydata::BoxScore
      expect(box_scores.first.away_defense).to be_an Array
      expect(box_scores.first.away_defense.first).to be nil
    end
  end

end
