require './lib/html_dictionary'
require 'pry'

class MarkDownConverter
  include HtmlDictionary

attr_reader :markdown_text

  def initialize(markdown_text)
    @markdown_text = markdown_text
  end

  def paragraphs
    @markdown_text = "<p>#{markdown_text}</p>"
      if markdown_text.include?("\n\n")
        markdown_text.gsub("\n\n", "</p>\n<p>")
      elsif markdown_text.include?("\n")
        markdown_text.gsub("\n", " ")
      else
        markdown_text
      end
  end


  def headers
    if @markdown_text.start_with?("#")
      header_symbol = @markdown_text.split[0]
      header_text = @markdown_text.split.drop(1).join(" ")
      header_lookup = HEADER_TAGS.fetch(header_symbol)
      converted_text = header_lookup.sub(" ", "#{header_text}")
    end
  end
end
