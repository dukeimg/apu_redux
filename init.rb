require './lib/apu'

print 'width: '
@width = gets.to_i # the number of cells on the X axis

print 'height: '
@height = gets.to_i # the number of cells on the Y axis

@cells = Array.new

puts "Enter cells in the row WITHOUT spaces. Node = '0' Empty cell = '.'"
@height.times do |n|
  print "row #{n + 1}: "
  line = gets.chomp # width characters, each either 0 or .
  @cells << line.split('') # заполняем ряды ячейками
end

@height.times do |row|
  @width.times do |cell|
    res = check(row, cell)
    puts res unless res == nil
  end
end