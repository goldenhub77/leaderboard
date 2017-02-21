require 'spec_helper'
require_relative '..\..\lib\leaderboard'

RSpec.describe Leaderboard do
  let(:leaderboard){Leaderboard.new}
  describe ".new" do
  # YOUR CODE GOES HERE
    it "creates a Leaderboard object" do
      expect(leaderboard).to be_kind_of(Leaderboard)
    end
  end
  describe ".team_objects" do
    it "creates array of objects of Team class for unique team names from GAME_INFO" do
      expect(leaderboard.team_objects).to be_instance_of(Array)
      expect(leaderboard.team_objects[0]).to be_kind_of(Object)
    end
    it "Team objects do not contain duplicate teams" do
      team_names = leaderboard.team_objects.map {|team| team.name}
      expect(team_names).to eq(team_names.uniq)
    end
  end

  describe ".wins_losses" do
    it "based upon GAME_INFO data Patriots have 3 wins 0 losses" do
      final_results = leaderboard.wins_losses
      final_results.each do |results|
        if results.name == "Patriots"
          expect(results.wins).to eq(3)
          expect(results.losses).to eq(0)
        end
      end
    end
    it "based upon GAME_INFO data Colts have 0 wins 2 losses" do
      final_results = leaderboard.wins_losses
      final_results.each do |results|
        if results.name == "Colts"
          expect(results.wins).to eq(0)
          expect(results.losses).to eq(2)
        end
      end
    end
  end

  describe ".sort_by_wins_then_losses" do
    it "teams must be in order or most wins, least losses(Patriots are 1st, Colts are last or 4th)\n
        ranks should be in order number 1 Patriots as best to Colts as worst" do
      leaderboard.wins_losses
      leaderboard.sort_by_wins_then_losses.each.with_index do |team, index|
        if team.name == "Patriots"
          expect(team.rank == 1 && team.wins == 3 && index == 0)
        elsif team.name == "Colts"
          expect(team.rank == 4 && team.wins == 0 && index == 3)
        end
      end
    end
  end

  describe ".summary" do
    let(:summary){leaderboard.summary}
    it "output must be a string" do
      puts summary
      expect(summary).to be_a_kind_of(String)
    end
    it "output must contain the GAME_INFO which is passed to it" do
      expect(summary.gsub(" ","")).to include("Name", "Rank", "TotalWins", "TotalLosses", "Patriots130", "Steelers211", "Broncos312", "Colts402")
    end
  end
end
