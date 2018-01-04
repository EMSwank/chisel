require 'pry'
class MarkDownConverter

attr_reader :markdown_text

  def initialize(markdown_text)
    @markdown_text = markdown_text
  end

  def paragraphs
      @markdown_text = "<p>#{markdown_text}</p>"
      if @markdown_text.include?("\n\n")
        @markdown_text.gsub("\n\n", "</p>\n<p>")
      elsif @markdown_text.include?("\n")
        @markdown_text.gsub("\n", " ")
      else
        @markdown_text
      end
  end

  def headers
    if @markdown_text.start_with?("# ")
      @markdown_text.slice!("# ")
      @markdown_text = "<h1>#{markdown_text}</h1>"
    elsif @markdown_text.start_with?("## ")
      @markdown_text.slice!("## ")
      @markdown_text = "<h2>#{markdown_text}</h2>"
    elsif markdown_text.start_with?("### ")
      @markdown_text.slice!("### ")
      @markdown_text = "<h3>#{markdown_text}</h3>"
    elsif markdown_text.start_with?("#### ")
      @markdown_text.slice!("#### ")
      @markdown_text = "<h4>#{markdown_text}</h4>"
    elsif markdown_text.start_with?("##### ")
      @markdown_text.slice!("###### ")
      @markdown_text = "<h5>#{markdown_text}</h5>"
    elsif markdown_text.start_with?("###### ")
      @markdown_text.slice!("###### ")
      @markdown_text = "<h6>#{markdown_text}</h6>"

    end
  end
end
