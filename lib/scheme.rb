class Scheme

  attr_accessor :height, :width, :cells

  def initialize(options={})
    @height = options[:height]
    @width = options[:width]
    @cells = options[:cells]
  end

  def node(cell) # проверяем ячейку на узел
    if cell == '0'
      true
    else
      false
    end
  end

  def coord1(row, cell)
    return "#{cell.to_s} #{row.to_s}" if node(@cells[row][cell]) # возврат координаты ячейки, если она существует
  end

  def coord2(row, cell)
    if (cell + 1) == @width # если ячейка последняя в ряде
      coord2 = '-1 -1' # то у неё нет соседа справа
    else
      1.upto(@width - cell) do |shift| # просматриваем ряд до конца в поисках узла
        # shift - смещение поиска
        if node(@cells[row][cell + shift])
          coord2 = "#{(cell + shift).to_s} #{row.to_s}"
          break # выход из цикла поиска
        end
      end
    end

    if coord2 == nil # если ничего не нашли
      coord2 = '-1 -1'
    end

    coord2
  end

  def coord3(row, cell)
    if (row + 1) == @height # если ниже уже некуда
      coord3 = '-1 -1'
    else
      1.upto(@height - row) do |shift| # просматриваем столбец
        if @cells[row + shift] == nil # ряда нет
          coord3 = '-1 -1'
          break
        elsif node(@cells[row + shift][cell])
          coord3 = "#{cell.to_s} #{(row + shift).to_s}"
          break
        end
      end
    end

    coord3
  end

  def check_all
    result = Array.new

    @height.times do |row|
      @width.times do |cell|
        result << check(row, cell)
      end
    end

    result
  end

  def check(row, cell)
    unless coord1(row, cell) == nil
      "#{coord1(row, cell)} #{coord2(row, cell)} #{coord3(row, cell)}"
    end
  end

end

