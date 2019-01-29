require 'pry'

# Write your code here!
def game_hash
  { :home => 
    {:team_name => "Brooklyn Nets", 
     :colors => ["Black, White"], 
     :players => {"Alan Anderson" => 
      {:number => 0, 
      :shoe => 16, 
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      "Reggie Evans" => {:number => 30, 
      :shoe => 14, 
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7},
      "Brook Lopez" => {:number => 11, 
      :shoe => 17, 
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15},
      "Mason Plumlee" => {:number => 1, 
      :shoe => 19, 
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5},
      "Jason Terry" => {:number => 31 , 
      :shoe => 15, 
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1}  } 
     },
     
     :away => 
     {:team_name => "Charlotte Hornets",  
     :colors => ["Turquoise", "Purple"], 
     :players => {"Jeff Adrien" => {:number =>  4, 
      :shoe => 18, 
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2},
     "Bismak Biyombo" =>  {:number => 0 , 
      :shoe =>  16, 
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10 },
     "DeSagna Diop" =>  {:number => 2, 
      :shoe => 14, 
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5},
     "Ben Gordon" =>  {:number => 8, 
      :shoe => 15, 
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0},
     "Brendan Haywood" => {:number => 33 , 
      :shoe => 15, 
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12}, 
    }, 
  }
}
end

def num_points_scored(player)
   game_hash.each do |location,team_data|
       team_data.each do |attribute, data|
          if attribute == :players
              data.each do |member, key|
                if member == player
                  key.each do |piece, keyval|
                    if piece == :points
                       return keyval
                    end
                  end
                end
              end
          end
       end
   end
end


def shoe_size(name)
  game_hash.each do |location,team_data|
      team_data.each do |attribute, data|
          if attribute == :players
              data.each do |member, key|
                if member == name
                    key.each do |piece, keyval|
                        if piece == :shoe
                          return keyval
                        end
                    end
              end
          end
      end
  end
end
end



def team_colors(teamname)
  if teamname == "Brooklyn Nets"
     return game_hash[:home][:colors][0].split(", ")
  end
  if teamname == "Charlotte Hornets"
     return game_hash[:away][:colors]
  end
end

def team_names
  teamNameArr = []
  teamNameArr << game_hash[:home][:team_name]  
  teamNameArr << game_hash[:away][:team_name]
end

def player_numbers(team)
   brooklyn = []
   charlotte = []
   if team == "Brooklyn Nets"
      game_hash[:home][:players].each do |guy, key |
          key.collect do |a, b|
            if a == :number
              brooklyn << b
            end
          end
      end
            return brooklyn.sort
   end
   
     if team == "Charlotte Hornets"
      game_hash[:away][:players].each do |guy, key |
          key.collect do |c, d|
            if c == :number
              charlotte << d
            end
          end
      end
   end
       charlotte
end



def player_stats(teammember)
   game_hash[:home][:players].each do |guy, key |
      if guy == teammember
        return key
       end
   end
   game_hash[:away][:players].each do |guy, key |
      if guy == teammember
        return key
       end
   end
end


def big_shoe_rebounds
  largest_shoe = 0
  player = nil
  game_hash.each do |x, y|
     y.each do |g, h|
       if g == :players
         h.each do |i, j|
           j.each do |k, l|
            if k == :shoe && l > largest_shoe
               largest_shoe = l
               player = i
            end
           end
         end
       end
    end
  end
       largest_shoe
       player
       
   game_hash.each do |one, two|  
     two.each do |three, four|
       if three == :players
         four.each do |five, eight|
           if five == player
              eight.each do |nine, ten|
                 if nine == :rebounds
                    return ten
                 end
              end
           end
         end
       end
    end 
  end 
end


def most_points_scored
  max_point = 0
  player = nil
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_name, stat|
       puts num_points_scored(player_name)
       
       if num_points_scored(player_name) > max_point
          max_point = num_points_scored(player_name)  
          player = player_name
         # binding.pry
       end
    end
  end
     player
end



def winning_team
  
end