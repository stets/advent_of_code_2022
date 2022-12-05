require 'pry'
# we need a way to keep state of a grid 

# we need to be able to have a step and calculate what will happen on the next step

# open the same file twice as a very stupid work around for shallow/deep cloning 
# eg, we can't have a new_arr variable referencing the old one 
# because if we update the new one, it'll update the old too.

file = File.open('sample_step2.txt')
matrix = file.readlines.map(&:chomp)
file.close

# always check whether their destination location is empty before moving
# East Facing cucumbers move first 
# then south.
# we need to find when the first step occurs with no moves.
# our func should return the step number we're on and the array output (maybe)

# check each line / outter loop X axis
def iterate_steps(matrix)
    moves_taken = 0
    
    # tomfoolery to avoid modifying the original object
    # https://stackoverflow.com/questions/36535969/ruby-array-changes-by-changing-a-copy-of-one-of-its-elements
    new_arr = Marshal.load(Marshal.dump(matrix))
    
    
    puts "Initial array:"
    puts "---------------"
    puts matrix
    puts "---------------"
    puts "---------------"
    puts "---------------"
    puts "---------------"
    puts "---------------"
    matrix.each_with_index do |line, idx_y|
        # puts line
        # puts idx_x
        # check each character, inner loop Y axis
        line.split("").each_with_index do |char, idx_x| 
            if char == ">"
                # check step to immediate right to see if we can move 
                # if its unoccupied or . , move
                if line[idx_x+1] == '.'
                    # set the tile we're moving to 
                    new_arr[idx_y][idx_x+1] = ">"
                    # unset the tile we're moving off of
                    # but only if someone didn't just move there..
                    if new_arr[idx_y][idx_x] != "v"
                        new_arr[idx_y][idx_x] = "."
                    end

                    moves_taken += 1
                # we need to check if the character is on the right edge 
                # if it is, we need to move it all the way to the left
                # we can check if the idx is the last item
                elsif idx_x + 1 == line.length and line[0] == '.'
                    # then check if first character of the line is free
                    # if so, move it.
                    # set dest
                    new_arr[idx_y][0] = ">"
                    # unset src
                    new_arr[idx_y][idx_x] = "."
                    # if we make a move, let's set a flag/counter
                    moves_taken += 1
                end
            elsif char == "v"
                # check if we are on the last line
                # check if the top line is free for us to move there
                if idx_y + 1 == matrix.length and matrix[0][idx_x] == '.'
                    puts 'we hit the final line????'
                    puts "final line is #{line}"
                    #binding.pry
                    
                    # set dest
                    new_arr[0][idx_x] = "v"
                    # unset src
                    new_arr[idx_y][idx_x] = "."
                    # if we make a move, let's set a flag/counter
                    moves_taken += 1
                # check tile underneath to see if we can move there
                # if its unoccupied (.), move
                elsif matrix[idx_y+1][idx_x] == '.' or matrix[idx_y+1][idx_x] == '>'
                    # set the tile we're moving to                     
                    new_arr[idx_y+1][idx_x] = "v"
                    
                    # unset the tile we're moving off of
                    new_arr[idx_y][idx_x] = "."
                    
                    moves_taken += 1
                # we need to check if the character is on the bottom edge 
                # if it is, we need to move it all the way to the left
                # we can check if the idx is the last item

                end
            end
            
        end
    end
    puts "Final step is "
    puts new_arr
    puts "we took #{moves_taken} moves"
    return moves_taken, new_arr
end



moves_taken = 1

while moves_taken != 0
    moves_taken, matrix = iterate_steps(matrix)
    sleep 2
end


# if it a v?
# is the step underneath it occupied? 
# if so, do nothing
# if not, move it!