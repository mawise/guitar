#!/usr/bin/env ruby
filename = ARGV[0]
amount = ARGV[1]

unless filename and amount
  puts "Please specify a filename and a shift amount as a number of half-steps"
  exit 1
end

chords = %w{A A# B C C# D D# E F F# G G#}
variations = ['', 'm', '7', 'm7']
shift = {}
variations.each do |var|
  (0...chords.size).each do |i|
   shift["[#{chords[i]}#{var}]"]="[#{chords[(i+1)%12]}#{var}]"
  end
end
outfile = File.new('tmp', 'w')
file = File.new(filename, 'r')
file.each_line do |line|
   amount.to_i.times {line.gsub!(/\[[A-G][m#7]*\]/, shift)}
   outfile.puts line 
end
file.close
outfile.close

