# Goal: determine how many pairs have fully contained sections
file = File.open('input.txt')
file_data = file.readlines.map(&:chomp)
file.close

fully_contained_sum = 0 

file_data.each do |line|
    elf_one, elf_two = line.split(',')[0], line.split(',')[1]
    
    elf_one_start, elf_one_end = elf_one.split('-').map{|x| x.to_i}
    elf_two_start, elf_two_end = elf_two.split('-').map{|x| x.to_i}

    elf_one_array = (elf_one_start..elf_one_end).to_a
    elf_two_array = (elf_two_start..elf_two_end).to_a

    elf_intersection = elf_one_array.intersection(elf_two_array)

    puts "calculated elf intersection length as #{elf_intersection.length}"

    if elf_intersection.length == elf_one_array.length or elf_intersection.length == elf_two_array.length
        puts "Found a fully contained set #{elf_one} and #{elf_two}"
        fully_contained_sum += 1
    end
end

puts "Found #{fully_contained_sum} intersections"