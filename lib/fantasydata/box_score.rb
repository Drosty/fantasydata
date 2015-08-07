require 'fantasydata/base'

module Fantasydata
  class BoxScore < Fantasydata::Base

    def away_defense
      @away_defense ||= map_collection(Fantasydata::Boxscore::PlayerDefenseStat, :away_defense)
    end

    def away_fantasy_defense
      @away_fantasy_defense ||= Fantasydata::Boxscore::TeamDefenseStat.new(@attrs[:away_fantasy_defense])
    end

    def away_kick_punt_returns
      @away_kick_punt_returns ||= map_collection(Fantasydata::Boxscore::ReturnStat, :away_kick_punt_returns)
    end

    def away_kicking
      @away_kicking ||= map_collection(Fantasydata::Boxscore::KickingStat, :away_kicking)
    end

    def away_passing
      @away_passing ||= map_collection(Fantasydata::Boxscore::PassingStat, :away_passing)
    end

    def away_punting
      @away_punting ||= map_collection(Fantasydata::Boxscore::PuntingStat, :away_punting)
    end

    def away_receiving
      @away_receiving ||= map_collection(Fantasydata::Boxscore::ReceivingStat, :away_receiving)
    end

    def away_rushing
      @away_rushing ||= map_collection(Fantasydata::Boxscore::RushingStat, :away_rushing)
    end

    def game
      @game ||= Fantasydata::GameStat.new(@attrs[:game])
    end

    def home_defense
      @home_defense ||= map_collection(Fantasydata::Boxscore::PlayerDefenseStat, :home_defense)
    end

    def home_fantasy_defense
      @home_fantasy_defense ||= Fantasydata::Boxscore::TeamDefenseStat.new(@attrs[:home_fantasy_defense])
    end

    def home_kick_punt_returns
      @home_kick_punt_returns ||= map_collection(Fantasydata::Boxscore::ReturnStat, :home_kick_punt_returns)
    end

    def home_kicking
      @home_kicking ||= map_collection(Fantasydata::Boxscore::KickingStat, :home_kicking)
    end

    def home_passing
      @home_passing ||= map_collection(Fantasydata::Boxscore::PassingStat, :home_passing)
    end

    def home_punting
      @home_punting ||= map_collection(Fantasydata::Boxscore::PuntingStat, :home_punting)
    end

    def home_receiving
      @home_receiving ||= map_collection(Fantasydata::Boxscore::ReceivingStat, :home_receiving)
    end

    def home_rushing
      @home_rushing ||= map_collection(Fantasydata::Boxscore::RushingStat, :home_rushing)
    end

    def score
      @score ||= Fantasydata::Boxscore::Score.new(@attrs[:score])
    end

    def scoring_details
      @scoring_details ||= map_collection(Fantasydata::ScoringDetail, :scoring_details)
    end

    def scoring_plays
      @scoring_plays ||= map_collection(Fantasydata::Boxscore::ScoringPlay, :scoring_plays)
    end

  end
end
