class Scheme

  attr_accessor :height, :width, :cells

  def initialize(options={})
    self.height = options[:height]
    self.width = options[:width]
    self.cells = options[:cells]
  end

  def check_all
    self.height.times do |row|
      self.width.times do |cell|
        res = check(row, cell)
        puts res unless res == nil
      end
    end
  end

  def node(cell) # проверяем ячейку на узел
    if cell == '0'
      true
    else
      false
    end
  end

  def check(row, cell)
    if node(self.cells[row][cell]) # ищем узел
      coord1 = cell.to_s + ' ' + row.to_s # записываем его координату

      if (cell + 1) == self.width # если ячейка последняя в ряде
        coord2 = '-1 -1' # то у неё нет соседа справа
      else
        1.upto(self.width - cell) do |shift| # просматриваем ряд до конца в поисках узла
          # shif - смезение поиска
          if node(self.cells[row][cell + shift])
            coord2 = (cell + shift).to_s + ' ' + row.to_s
            break # выход из цикла поиска
          end
        end
      end
      if coord2 == nil # если ничего не нашли
        coord2 = '-1 -1'
      end

      if (row + 1) == self.height # если ниже уже некуда
        coord3 = '-1 -1'
      else
        1.upto(self.height - row) do |shift| # просматриваем столбец
          if self.cells[row + shift] == nil # ряда нет
            coord3 = '-1 -1'
            break
          elsif node(self.cells[row + shift][cell])
            coord3 = cell.to_s + ' ' + (row + shift).to_s
            break
          end
        end
      end
      return coord1 + ' ' + coord2 + ' '  + coord3
    end
  end

end

