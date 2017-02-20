# require_relative 'leaderboard'
class Team
  # YOUR CODE GOES HERE
  attr_reader :name, :rank, :wins, :losses
  def initialize(team)
    @name = team
    @rank = nil
    @wins = 0
    @losses = 0
  end
end
