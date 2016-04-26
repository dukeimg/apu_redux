class InputOutputHandler

  attr_accessor :width, :height
  attr_reader :cells

  def initialize
    @width = 0
    @height = 0
    @cells = Array.new
  end

  def input
    print 'width: '
    @width = gets.to_i
    print 'height: '
    @height = gets.to_i

    puts "Enter cells in the row WITHOUT spaces. Node = '0' Empty cell = '.'"
    height.times do |n|
      print "row #{n + 1}: "
      line = gets.chomp # width characters, each either 0 or .
      cells << line.split('') # заполняем ряды ячейками
    end

  end

  def output(data)
    puts data
  end

end