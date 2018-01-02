class HTMLFileWriter

def read_file(filename)
  @markdown = File.readlines("./" + filename)
end

def output_new_file(filename)
  output = File.new("./" + filename, "w+")
  File.open(output, "w+") do |file|
    file.puts convert_to_html
  end
