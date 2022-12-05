file = File.open('input.txt')
instructions = file.readlines.map(&:chomp)
file.close

file = File.open('crates.txt')
crates = file.readlines.map(&:chomp)
file.close


crate_mapping = {}
# references the crate count line
crates[8].split.each do |crate_no|
    crate_mapping[crate_no.to_i] = []
end

# sets up the crates data structure
crates.each do |line|
    (0..34).step(4).each_with_index do |x, idx|
        char_group = line[x..x+2]
        if char_group.include? "["
            puts char_group
            char_group.delete!("[]")
            puts "Belongs to crate number #{idx+1}"
            crate_mapping[idx+1].append(char_group)
        end
        puts x+1
        
    end    
end


# reverse each item
(1..crate_mapping.length).each do |x|
    crate_mapping[x].reverse!
end

instructions.each do |ins|
    ins.delete!("movefromto")
    amt, from, to = ins.split(" ")

    # uncomment below line for part 1 answer
    #items_to_move = crate_mapping[from.to_i].pop(amt.to_i).reverse
    # comment below line for part 1 answer
    items_to_move = crate_mapping[from.to_i].pop(amt.to_i)

    puts "items to move are #{items_to_move}"
    items_to_move.each do |item|
        crate_mapping[to.to_i].push(item)
    end
end

# todo:
# output the real answer instead of crate mapping
puts crate_mapping