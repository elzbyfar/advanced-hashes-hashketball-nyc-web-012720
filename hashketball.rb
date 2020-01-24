    # # # *** N D S *** # # #
def game_hash 
    hash = {
      :home => {
        :team_name => "Brooklyn Nets", 
        :colors => ["Black", "White"], 
        :players => [
          {
            :player_name => "Alan Anderson", 
            :number => 0, 
            :shoe => 16, 
            :points => 22, 
            :rebounds => 12, 
            :assists => 12, 
            :steals => 3, 
            :blocks => 1, 
            :slam_dunks => 1
          }, {
            :player_name => "Reggie Evans", 
            :number => 30, 
            :shoe => 14, 
            :points => 12, 
            :rebounds => 12, 
            :assists => 12, 
            :steals => 12, 
            :blocks => 12, 
            :slam_dunks => 7  
          }, {
            :player_name => "Brook Lopez", 
            :number => 11, 
            :shoe => 17, 
            :points => 17, 
            :rebounds => 19, 
            :assists => 10, 
            :steals => 3, 
            :blocks => 1, 
            :slam_dunks => 15
          }, {
            :player_name => "Mason Plumlee", 
            :number => 1, 
            :shoe => 19, 
            :points => 26, 
            :rebounds => 11, 
            :assists => 6, 
            :steals => 3, 
            :blocks => 8, 
            :slam_dunks => 5
          }, {
            :player_name => "Jason Terry", 
            :number => 31, 
            :shoe => 15, 
            :points => 19, 
            :rebounds => 2, 
            :assists => 2, 
            :steals => 4, 
            :blocks => 11, 
            :slam_dunks => 1 
          }
        ]
      }, 
      :away => {
        :team_name => "Charlotte Hornets", 
        :colors => ["Turquoise", "Purple"], 
        :players => [
          {
            :player_name => "Jeff Adrien", 
            :number => 4, 
            :shoe => 18, 
            :points => 10, 
            :rebounds => 1, 
            :assists => 1, 
            :steals => 2, 
            :blocks => 7, 
            :slam_dunks => 2
          }, {
            :player_name => "Bismack Biyombo", 
            :number => 0, 
            :shoe => 16, 
            :points => 12, 
            :rebounds => 4, 
            :assists => 7, 
            :steals => 22, 
            :blocks => 15, 
            :slam_dunks => 10   
          }, {
            :player_name => "DeSagna Diop", 
            :number => 2, 
            :shoe => 14, 
            :points => 24, 
            :rebounds => 12, 
            :assists => 12, 
            :steals => 4, 
            :blocks => 5, 
            :slam_dunks => 5
          }, {
            :player_name => "Ben Gordon", 
            :number => 8, 
            :shoe => 15, 
            :points => 33, 
            :rebounds => 3, 
            :assists => 2, 
            :steals => 1, 
            :blocks => 1, 
            :slam_dunks => 0
          }, {
            :player_name => "Kemba Walker", 
            :number => 33, 
            :shoe => 15, 
            :points => 6, 
            :rebounds => 12, 
            :assists => 12, 
            :steals => 7, 
            :blocks => 5, 
            :slam_dunks => 12
          }
        ]
      }
    }
    
    hash 
end 


    # # # *** A B S T R A C T I O N S *** # # #
def find_player_by_name(find_player)
    game_hash.each_value do |team_hash|
        found = team_hash[:players].find do |player|
            player[:player_name] == find_player
        end 
        if found 
            return found 
        end
    end 
end 

def find_team_by_name(find_team)
    found = game_hash.values.find do |team_hash|
        team_hash[:team_name] == find_team
    end 
    if found 
        return found
    end
    nil
end 

def find_biggest(stat)
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    merge_and_max = home.concat(away).max_by do |player|
        player[stat]
    end 
    return merge_and_max
end 


# # # *** S O L U T I O N S *** # # #
def num_points_scored(find_player)
    found_player = find_player_by_name(find_player)
    if found_player 
        return found_player[:points]
    end 
    nil
end

def shoe_size(find_player)
    found_player = find_player_by_name(find_player)
    if found_player 
        return found_player[:shoe]
    end
    nil
end 

def team_colors(find_team)
    found_team = find_team_by_name(find_team)
    if found_team
        return found_team[:colors]
    end 
end 

def team_names
    teams = game_hash.values.map do |team_hash| 
        team_hash[:team_name] 
    end 
    teams
end 

def player_numbers(find_team)
    found_team = find_team_by_name(find_team)
    if found_team 
        team_num_arr = found_team[:players].map do |player|
            player[:number]
        end 
    end 
    team_num_arr
end 

def player_stats(find_player)
    found_player = find_player_by_name(find_player)
    if found_player 
        stats_hash = found_player.clone
        stats_hash.delete(:player_name)
    end 
    stats_hash
end 

def big_shoe_rebounds
    biggest_shoe = find_biggest(:shoe)
    if biggest_shoe 
        return biggest_shoe[:rebounds]
    end 
    nil
end 

def most_points_scored
    most_points = find_biggest(:points)
    if most_points 
        return most_points[:player_name]
    end 
    nil 
end 

def winning_team
    winner = game_hash.values.max_by do |team_hash|
        team_hash[:players].reduce(0) do |total, player|
            total + player[:points]
        end 
    end 
    winner[:team_name]
end 

def player_with_longest_name 
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    longest = home.concat(away).max_by do |player|
        player[:player_name].length
    end 
    longest[:player_name]
end 

def long_name_steals_a_ton?
    find_player_by_name(player_with_longest_name)[:steals] > 20 ? true : false
end 