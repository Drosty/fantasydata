require 'helper'

describe Fantasydata::API::Week do

  before do
    @client = new_test_client
  end

  describe '#week_current' do
    before do
      stub_get("/nfl/v2/JSON/CurrentWeek").
      to_return(:body => fixture("week/current.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.current_week
      expect(a_get("/nfl/v2/JSON/CurrentWeek")).to have_been_made
    end

    it "returns player details" do
      current_week = @client.current_week

      expect(current_week).to be_an Integer
      expect(current_week).to eq 16
    end
  end

  describe '#week_last_completed' do
    before do
      stub_get("/nfl/v2/JSON/LastCompletedWeek").
      to_return(:body => fixture("week/last_completed.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.last_completed_week
      expect(a_get("/nfl/v2/JSON/LastCompletedWeek")).to have_been_made
    end

    it "returns player details" do
      week = @client.last_completed_week

      expect(week).to be_an Integer
      expect(week).to eq 4
    end
  end

  describe '#week_upcoming' do
    before do
      stub_get("/nfl/v2/XML/UpcomingWeek").
      to_return(:body => fixture("week/upcoming.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests correct resource" do
      @client.upcoming_week
      expect(a_get("/nfl/v2/XML/UpcomingWeek")).to have_been_made
    end

    it "returns player details" do
      current_week = @client.upcoming_week

      expect(current_week).to be_an Integer
      expect(current_week).to eq 9
    end
  end

end
