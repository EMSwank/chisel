require 'pry'
class MarkDownConverter

attr_reader :markdown_text

  def initialize(markdown_text)
    @markdown_text = markdown_text
  end

  def paragraph
      @markdown_text = "<p>#{markdown_text}</p>"
      if @markdown_text.include?("\n\n")
        @markdown_text.gsub("\n\n", "</p>\n<p>")
      elsif @markdown_text.include?("\n")
        @markdown_text.gsub("\n", " ")
      else
        @markdown_text
      end

  end
end
