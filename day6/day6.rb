require "pry"
file = File.open('input.txt')
packet = file.readlines.map(&:chomp)[0]
file.close


(0..packet.length).each do |idx|
    #puts char
    preamble_check = packet[idx..idx+3]
    #binding.pry
    if preamble_check.scan(/[a-z]/i).uniq.length == 4
        puts "Found unique characters at #{preamble_check}, preamble marker ends at #{idx+4}"
        break
    end
end


(0..packet.length).each do |idx|
    start_of_message_marker = packet[idx..idx+13]
    if start_of_message_marker.scan(/[a-z]/i).uniq.length == 14
        puts "Found unique characters at #{start_of_message_marker}, preamble marker ends at #{idx+14}"
        return
    end
end

# read each character from the stream
# keep a running count of the last 4 
# measure the index 

