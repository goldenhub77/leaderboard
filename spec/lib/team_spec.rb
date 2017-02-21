require 'spec_helper'
require_relative '..\..\lib\team'

RSpec.describe Team do
  let(:team){Team.new("Patriots")}
  describe ".new" do
    it 'has a name' do
      expect(team.name).to eq("Patriots")
    end
    it 'has a rank' do
      expect(team.rank).to eq(nil)
    end
    it 'has a wins count' do
      expect(team.wins).to eq(0)
    end
    it 'has a loss count' do
      expect(team.losses).to eq(0)
    end
    it 'make sure you can only read team and read/write to rank,wins, & losses' do
      expect{team.name = 'test'}.to raise_error(NoMethodError)
      expect(team.wins= 4).to eq(4)
      expect(team.losses= 4).to eq(4)
      expect(team.rank= 4).to eq(4)
    end
  end

  describe ".self.title" do
    it "should output and array of string header columns for leaderboard" do
      expect(Team.title).to be_of_instance(Array)
    end
  end
end
