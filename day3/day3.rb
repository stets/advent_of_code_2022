# https://adventofcode.com/2022/day/3

file = File.open('input.txt')
file_data = file.readlines.map(&:chomp)
file.close

# https://stackoverflow.com/questions/54325920/ruby-inbuilt-method-to-get-the-position-of-letter-in-the-alphabet-series
# https://www.rubyguides.com/2018/10/ruby-map-method/

# Goal:
# Find the item type that appears in both compartments of a ruck sack. 
# what is the sum of the priorities of all of these?

rucksack_sum = 0

file_data.each do |line|
    halfway_point = (line.length / 2) - 1 
    puts line[0..halfway_point]
    first_compartment = line[0..halfway_point]
    second_compartment = line[(halfway_point + 1)..-1]
    puts "1st compartment contains #{first_compartment}"
    puts "2nd compartment contains #{second_compartment}"
    puts "together they are #{line}"
    seen = []
    # for each item in the first list, check if a character is in the other rucksack
    first_compartment.split("").each do |item|
        if second_compartment.include? item
            puts "second compartment includes item #{item}"
            if seen.include?(item)
                puts "we have already seen #{item}"
            elsif /[[:upper:]]/.match(item)
                seen.append(item)
                priority = item.downcase.bytes.map{|character| character - 96}[0] + 26
                puts "Priority is #{priority}"
                rucksack_sum += priority
            elsif
                seen.append(item)
                priority = item.bytes.map{|character| character - 96}[0]
                puts "Priority is #{priority}"
                rucksack_sum += priority
            end
        end
    end
end

puts "Final sum of priorities is #{rucksack_sum}"