require 'helper'

describe Fantasydata::API::Timeline do

  before do
    @client = new_test_client
  end

  describe '#current_timelines' do
    before do
      stub_get("/nfl/v2/JSON/Timeframes/current").
      to_return(:body => fixture("timeline/current.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.current_timeline
      expect(a_get("/nfl/v2/JSON/Timeframes/current")).to have_been_made
    end

    it "returns data" do
      timeline = @client.current_timeline

      expect(timeline).to be_an Fantasydata::Timeline
      expect(timeline.short_name).to eq 'NFL Draft'
      expect(timeline.has_games).to eq false
    end
  end

  describe '#upcoming_timelines' do
    before do
      stub_get("/nfl/v2/JSON/Timeframes/upcoming").
      to_return(:body => fixture("timeline/upcoming.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.upcoming_timelines
      expect(a_get("/nfl/v2/JSON/Timeframes/upcoming")).to have_been_made
    end

    it "returns data" do
      timelines = @client.upcoming_timelines

      expect(timelines).to be_an Array
      expect(timelines.first).to be_an Fantasydata::Timeline
      expect(timelines.first.short_name).to eq 'NFL Draft'
      expect(timelines.first.has_games).to eq false
    end
  end

  describe '#completed_timelines' do
    before do
      stub_get("/nfl/v2/JSON/Timeframes/completed").
      to_return(:body => fixture("timeline/completed.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.completed_timelines
      expect(a_get("/nfl/v2/JSON/Timeframes/completed")).to have_been_made
    end

    it "returns data" do
      timelines = @client.completed_timelines

      expect(timelines).to be_an Array
      expect(timelines.first).to be_an Fantasydata::Timeline
      expect(timelines.first.short_name).to eq 'Free Agency'
      expect(timelines.first.has_games).to eq false
    end
  end

  describe '#all_timelines' do
    before do
      stub_get("/nfl/v2/JSON/Timeframes/all").
      to_return(:body => fixture("timeline/all.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.all_timelines
      expect(a_get("/nfl/v2/JSON/Timeframes/all")).to have_been_made
    end

    it "returns data" do
      timelines = @client.all_timelines

      expect(timelines).to be_an Array
      expect(timelines.first).to be_an Fantasydata::Timeline
      expect(timelines.first.short_name).to eq 'Offseason'
      expect(timelines.first.has_games).to eq false
    end
  end

end
