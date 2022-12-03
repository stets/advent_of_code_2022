# https://adventofcode.com/2022/day/3

file = File.open('input.txt')
file_data = file.readlines.map(&:chomp)
file.close

# https://stackoverflow.com/questions/54325920/ruby-inbuilt-method-to-get-the-position-of-letter-in-the-alphabet-series

# determine the priority with ruby bytes magic 
# 'sampleContentsashfjklasfjkhFJalskjfklsf'.bytes 
# subtract 96 or whatever to get the "true" value
# use map function to transform data
# https://www.rubyguides.com/2018/10/ruby-map-method/



# Goal:
# Find the item type that appears in both compartments of a ruck sack. 
# what is the sum of the priorities of all of these?


rucksack_sum = 0

# for each line
file_data.each do |line|

    # take each line and find the length, divide it by 2 
    # then, slice it up [0.. length - 1] minus 1 since we're indexing
    # this gives us 2 lists    
    halfway_point = (line.length / 2) - 1 
    puts line[0..halfway_point]
    first_compartment = line[0..halfway_point]
    second_compartment = line[(halfway_point + 1)..-1]
    puts "1st compartment contains #{first_compartment}"
    puts "2nd compartment contains #{second_compartment}"
    puts "together they are #{line}"
    # for each item in the first list, check if a character is in the other rucksack
    seen = []
    first_compartment.split("").each do |item|
        # set a var for characters we've seen before
        
        if second_compartment.include? item
            puts "second compartment includes item #{item}"
            # now we must do math on em and find the priority
            # check first if it's upper case with regex
            if seen.include?(item)
                puts "we have already seen #{item}, so we're returning"
                
            
            elsif /[[:upper:]]/.match(item)
                seen.append(item)
                # do a thing
                # if it is, then, downcase it and add 26 to get the priority of an upper case
                # now calculate the priority
                priority = item.downcase.bytes.map{|character| character - 96}[0] + 26
                # todo: need to add 26.
                puts "#{item} is upper case"
                puts "Priority is #{priority}"
                rucksack_sum += priority
            # else if it isn't upper case
            elsif
                seen.append(item)
                priority = item.bytes.map{|character| character - 96}[0]
                puts "Priority is #{priority}"
                rucksack_sum += priority
                # puts "#{item} is not upper case"
            end

        end
        # check if it's in the second half
    end
end

puts "Final sum of priorities is #{rucksack_sum}"