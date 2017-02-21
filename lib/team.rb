# require_relative 'leaderboard'
class Team
  # YOUR CODE GOES HERE
  attr_reader :name
  attr_accessor :wins, :losses, :rank
  def initialize(team)
    @name = team
    @rank = nil
    @wins = 0
    @losses = 0
  end

  def self.title
    ["| ", "Name       ", "Rank    ", "Total Wins    ", "Total Losses", " |"]
  end

  # def summary
  #   ["| ", @name, @rank, @wins, @losses, " |"]
  # end
end
