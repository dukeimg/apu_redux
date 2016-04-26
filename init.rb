require './lib/scheme'

print 'width: '
width = gets.to_i # the number of cells on the X axis

print 'height: '
height = gets.to_i # the number of cells on the Y axis

cells = Array.new

puts "Enter cells in the row WITHOUT spaces. Node = '0' Empty cell = '.'"
height.times do |n|
  print "row #{n + 1}: "
  line = gets.chomp # width characters, each either 0 or .
  cells << line.split('') # заполняем ряды ячейками
end

Scheme.new(:height => height,
           :width => width,
           :cells => cells).check_all
