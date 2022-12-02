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

outcomes = {"A X" => "draw",
            "A Y" => "win",
            "A Z" => "lose",
            "B X" => "lose",
            "B Y" => "draw",
            "B Z" => "win",
            "C X" => "win",
            "C Y" => "lose",
            "C Z" => "draw"}

file_data.each do |line|
    my_shape = line[-1]
    if my_shape == "X"
        total_score += 1
    elsif my_shape == "Y"
        total_score += 2
    elsif my_shape == "Z"
        total_score += 3
    end
    
    if outcomes[line] == "win"
        total_score += 6
    elsif outcomes[line] == "draw"
        total_score += 3
        puts "Line was #{line} and score 3"
    elsif outcomes[line] == "lose"
        total_score += 0
    end
end

puts "Final score is #{total_score}"
