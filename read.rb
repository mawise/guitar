#!/usr/bin/env ruby

rows = ARGV[2] || 36
cols = ARGV[3] || 150
splits = ARGV[1] || 2
splits = splits.to_i

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

(0...rows).each do |line_number|
  display_line =  ""
  (0...splits).each do |split|
    if line_number + (rows*split) < lines.size
      display_line << '|' unless split == 0
      begin
        display_line << lines[line_number+(rows*split)][0..(cols/splits)][0...-1] #drop the trailing /n
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
