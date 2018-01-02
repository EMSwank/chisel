class MarkDownConverter

attr_reader :markdown_text

  def initialize(markdown_text)
    @markdown_text = markdown_text
  end

  def paragraph
    @markdown_text = "<p>#{markdown_text}</p>"
      markdown_text.gsub("\n", " ")
  end
end
