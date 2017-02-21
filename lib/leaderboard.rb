require_relative 'team'
class Leaderboard
  GAME_INFO = [
      {
        home_team: "Patriots",
        away_team: "Broncos",
        home_score: 17,
        away_score: 13
      },
      {
        home_team: "Broncos",
        away_team: "Colts",
        home_score: 24,
        away_score: 7
      },
      {
        home_team: "Patriots",
        away_team: "Colts",
        home_score: 21,
        away_score: 17
      },
      {
        home_team: "Broncos",
        away_team: "Steelers",
        home_score: 11,
        away_score: 27
      },
      {
        home_team: "Steelers",
        away_team: "Patriots",
        home_score: 24,
        away_score: 31
      }
  ]

# YOUR CODE GOES HERE
  def initialize
    team_objects
  end

  def team_objects
    team_names = []
    team_objects_arr = []
    GAME_INFO.each do |standings|
      team_names.push(standings[:home_team],standings[:away_team])
    end
    team_names.uniq!
    team_names.each do |name|
      team_objects_arr << Team.new(name)
    end
    team_objects_arr
  end

  def wins_losses
    team_object_arr = team_objects
    GAME_INFO.each do |standings|
      if standings[:home_score] > standings[:away_score]
        winner = standings[:home_team]
        loser = standings[:away_team]
      else
        winner = standings[:away_team]
        loser = standings[:home_team]
      end
      team_object_arr.each do |team|
        if team.name == winner
          team.wins += 1
        elsif team.name == loser
          team.losses +=1
        end
      end
    end
    team_object_arr
  end

  def sort_by_wins_then_losses
    team_object_arr = wins_losses
    team_object_arr.sort! do |least, most|
      [most.wins,least.losses] <=> [least.wins,most.losses]
    end
    team_object_arr.each.with_index do |team, index|
      team.rank = index + 1
    end
    team_object_arr
  end

  def summary
    header = ""
    banner = ""
    header_col_sizes = []
    terminal_team_data = "\n"
    formatted_team_data = sort_by_wins_then_losses
    Team.title.each do |title_part|
      header += title_part
      header_col_sizes << title_part.length
    end
    formatted_team_data.each do |team_data|
      name = team_data.name.to_s
      rank = team_data.rank.to_s
      wins = team_data.wins.to_s
      losses = team_data.losses.to_s
      terminal_team_data += "\n| " + name
      (header_col_sizes[1] - name.length).times do
        terminal_team_data += " "
      end
      terminal_team_data += rank
      (header_col_sizes[2] - rank.length).times do
        terminal_team_data += " "
      end
      terminal_team_data += wins
      (header_col_sizes[3] - wins.length).times do
        terminal_team_data += " "
      end
      terminal_team_data += losses
      (header_col_sizes[4] - losses.length).times do
        terminal_team_data += " "
      end
      terminal_team_data += " |\n"
    end
    header.length.times do
      banner += "-"
    end
    puts banner
    print header
    print terminal_team_data
    print banner
  end

  # def summary
  #   formatted_data = sort_by_wins_then_losses
  #   final_output = "\n"
  #   header_titles = {"Name" => 5, "Rank" => 0, "Total Wins" => 0, "Total Losses" => 0}
  #   total_width = 0
  #   header_titles.each do |key,value|
  #     total_width += key.to_s.length+value
  #   end
  #   (total_width*2).times do
  #     final_output += "-"
  #   end
  #   final_output += "\n| "
  #   header_titles.each do |key,value|
  #     final_output += "#{key}"
  #     (key.to_s.length+value).times do
  #       final_output += " "
  #     end
  #   end
  #   (header_titles.length-4).times do
  #     final_output += " "
  #   end
  #   final_output += "|\n"
  #
  #
  #   formatted_data.each do |final_team_results|
  #     team_data_arr = []
  #     team_data_arr.push(final_team_results.name, final_team_results.rank, final_team_results.wins, final_team_results.losses)
  #     final_output += "\n| "
  #     team_data_arr.each.with_index do |team_data, index|
  #
  #         final_output += "#{team_data}"
  #         (header_titles.keys[index].to_s.length+header_titles.values[index]-team_data.to_s.length+header_titles.keys[index].to_s.length).times do
  #             final_output += " "
  #         end
  #
  #     end
  #     final_output += "|\n"
  #   end
  #
  #   (total_width*2).times do
  #     final_output += "-"
  #   end
  #   final_output
  # end

end

leaderboard = Leaderboard.new
leaderboard.summary
