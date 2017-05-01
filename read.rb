#!/usr/bin/env ruby

rows = ARGV[2].to_i
cols = ARGV[3].to_i
splits = ARGV[1].to_i
offset = 0

rows = 36 if rows == 0
cols = 149 if cols == 0
splits = 2 if splits == 0

filename = ARGV[0]
puts "Filename: #{filename}"
unless filename
  puts "Please pass in the name of a file to display"
  exit 1
end

file = File.new(filename, 'r')
lines = []
file.each_line {|line| lines << line}
file.close

rows = lines.size if lines.size < rows
loop do
  5.times{puts ""}
  (0...rows).each do |line_number|
    display_line =  ""
    (0...splits).each do |split|
      if line_number + (rows*split) + offset < lines.size
        display_line << '|' unless split == 0
        begin
          display_line << lines[line_number+(rows*split)+offset][0..(cols/splits)][0...-1] #drop the trailing /n
        rescue Exception => e
          puts "line_number: #{line_number}"
          puts "lines.size: #{lines.size}"
          puts "rows: #{rows}"
          puts "splits: #{splits}"
          puts "split: #{split}"
          puts "display line: #{display_line}."
          puts "lines[linenumber+rows*split]: #{lines[line_number+(rows*split)]}"
          raise e
        end
        extra = (split+1)*(cols/splits) - display_line.size
        extra.times {display_line<<" "}
      end
    end
    puts display_line
  end
  input = STDIN.gets.chomp
  offset +=rows if input == ''
  offset -=rows if [' ', 'b'].include? input[0]
  offset = 0 if offset < 0
  break unless [nil, ' ', 'b'].include? input[0]
  break if offset > lines.size
end 
