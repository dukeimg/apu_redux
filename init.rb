require './lib/scheme'
require './lib/input_output_handler'

app = InputOutputHandler.new
app.input
Scheme.new(:height => app.height,
           :width => app.width,
           :cells => app.cells).check_all.each do |row|
  app.output(row)
end
