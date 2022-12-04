# Goal: determine how many pairs have fully contained sections
file = File.open('input.txt')
file_data = file.readlines.map(&:chomp)
file.close

intersecting_ranges = 0 

file_data.each do |line|
    elf_one, elf_two = line.split(',')[0], line.split(',')[1]
    
    elf_one_start, elf_one_end = elf_one.split('-').map{|x| x.to_i}
    elf_two_start, elf_two_end = elf_two.split('-').map{|x| x.to_i}

    elf_one_array = (elf_one_start..elf_one_end).to_a
    elf_two_array = (elf_two_start..elf_two_end).to_a

    elf_intersection = elf_one_array.intersection(elf_two_array)

    puts "calculated elf intersection length as #{elf_intersection.length}"

    if elf_intersection.length > 0
        puts "Found an intersection #{elf_one} and #{elf_two}"
        intersecting_ranges += 1
    end
end

puts "Found #{intersecting_ranges} intersections"