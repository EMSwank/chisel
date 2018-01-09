require './lib/html_dictionary'
require 'pry'

class MarkDownConverter
  include HtmlDictionary

attr_reader :markdown_text

  def initialize(markdown_text)
    @markdown_text = markdown_text
  end

  def paragraphs
    unless markdown_text.start_with?("#", "*")
      @markdown_text = "<p>#{markdown_text}</p>"
        if markdown_text.include?("\n\n")
          markdown_text.gsub("\n\n", "</p>\n<p>")
        elsif markdown_text.include?("\n")
          markdown_text.gsub("\n", " ")
        else
          markdown_text
        end
    end
  end


  def headers
    if markdown_text.start_with?("#")
      header_symbol = markdown_text.split[0]
      header_text = markdown_text.split.drop(1).join(" ")
      header_lookup = HEADER_TAGS.fetch(header_symbol)
      converted_text = header_lookup.sub(" ", "#{header_text}")
    end
  end

  def emphasis
    text = []
     markdown_text.split.each do |word|
          if word.include?("**")
            text << word
          elsif word.start_with?("*") && word.end_with?("*") == true
            swap_front_symbol = word.sub("*", "<em>")
            swap_both_symbols = swap_front_symbol.sub("*", "</em>")
            text << swap_both_symbols
          elsif word.start_with?("*")
            swap_front_symbol = word.sub("*", "<em>")
            text << swap_front_symbol
          elsif word.end_with?("*")
            swap_back_symbol = word.sub("*", "</em>")
            text << swap_back_symbol
          else
            text << word
          end
      end
    text.join(" ")
  end

  def strong
    text = []
     emphasis.split.each do |word|
          if word.start_with?("**") && word.end_with?("**") == true
            swap_front_symbol = word.sub("**", "<st>")
            swap_both_symbols = swap_front_symbol.sub("**", "</st>")
            text << swap_both_symbols
          elsif word.start_with?("**")
            swap_front_symbol = word.sub("*", "<st>")
            text << swap_front_symbol
          elsif word.end_with?("*")
            swap_back_symbol = word.sub("**", "</st>")
            text << swap_back_symbol
          else
            text << word
          end
        end
    text.join(" ")
  end

    def un_lists
      if markdown_text.start_with?("* ")
        text = []
        final_text = []
        list_symbol = markdown_text.split[0]
        list_text = markdown_text.split.drop(1).join(" ")
        break_items = list_text.gsub("*", "").split
        text = break_items
        text.map do |word|
          list_lookup = LIST_TAGS.fetch(list_symbol)
          converted_text = list_lookup.sub(" ", "#{word}")
          final_text  << converted_text
        end
        output = "<ul>\n#{final_text.join}</ul>"
      end
    end
end
