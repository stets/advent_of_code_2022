file = File.open('input.txt')
file_data = file.readlines.map(&:chomp)
file.close

total_score = 0

# lose - 0 pts
# draw - 3 pts
# win - 6 pts

# A / X Rock - 1 pts
# B / Y Paper - 2 pts
# C / Z Scissors - 3 pts

# X Lose
# Y Draw
# Z Win

strategy_map = {
    "A win" => 2,
    "A draw" => 1,
    "A lose" => 3,
    "B win" => 3,
    "B draw" => 2,
    "B lose" => 1,
    "C win" => 1,
    "C draw" => 3,
    "C lose" => 2,
}

file_data.each do |line|
    my_strategy = line[-1]
    if my_strategy == "X"
        strategy = "lose"
        total_score += 0
    elsif my_strategy == "Y"
        strategy = "draw"
        total_score += 3
    elsif my_strategy == "Z"
        strategy = "win"
        total_score += 6
    end

    opponent_shape = line[0]

    #total_score+=strategy_map[opponent_shape+' '+strategy]
    #puts " points scored #{strategy_map[opponent_shape+' '+strategy]}"
    puts opponent_shape + ' '+ strategy

end

puts "Final score is #{total_score}"
