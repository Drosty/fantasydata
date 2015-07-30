require 'fantasydata/base'

module Fantasydata
  class News < Fantasydata::Base
    attr_reader :news_id, :title, :updated, :url, :content, 
                :source, :terms_of_use, :team, :player_id
  end
end
