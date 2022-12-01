# https://www.rubyguides.com/2015/05/working-with-files-ruby/
file = File.open('input.txt')
# use chomp method to remove new lines
file_data = file.readlines.map(&:chomp)
file.close

sums = []
sum = 0
file_data.each do |line|
    if line != ""
        sum += line.to_i
    elsif line == ""
        sums.append(sum)
        sum = 0 
    end
end

puts sums.max