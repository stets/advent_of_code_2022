# https://adventofcode.com/2022/day/3

file = File.open('input.txt')
file_data = file.readlines.map(&:chomp)
file.close

# https://stackoverflow.com/questions/54325920/ruby-inbuilt-method-to-get-the-position-of-letter-in-the-alphabet-series
# https://www.rubyguides.com/2018/10/ruby-map-method/
# https://blog.saeloun.com/2019/10/14/ruby-adds-array-intersection.html

# Goal:
# Find the intersection of each "group" of 3 lines
# calculate and sum the priorities for the common items
# iterate over every "group" of 3 in the input

def determine_priority(char)
    # check if uppercase
    if /[[:upper:]]/.match(char)
        return char.downcase.bytes.map{|character| character - 96}[0] + 26
    else
        return char.bytes.map{|character| character - 96}[0]
    end
end

rucksack_sum = 0

for num in 0..((file_data.length / 3)  - 1) do
    # puts file_data[]
    puts "group:"
    group = file_data[(num*3)..((num*3)+2)]
    puts group

    intersection = group[0].split("").intersection(group[1].split("")).intersection(group[2].split(""))
    puts "Intersection is #{intersection}"
    rucksack_sum += determine_priority(intersection[0])
end

puts "Final sum of priorities is #{rucksack_sum}"