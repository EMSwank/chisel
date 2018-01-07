input = ARGV[0]
output = ARGV[1]

new_html = MarkDownConverter.new
chisel.read_file(input)
chisel.output_new_file(output)

puts "Created '#{output}' containing #{chisel.message.chars.count} characters"
