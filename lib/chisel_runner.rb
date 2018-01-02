input = ARGV[0]
output = ARGV[1]

new_html = MarkDownConverter.new
new_html.read_file(input)
new_html.output_new_file(output)

puts "Created '#{output}' containing #{new_html.message.chars.count} characters"
