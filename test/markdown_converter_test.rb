require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/markdown_converter.rb'

class MarkDownConverterTest < Minitest::Test

  def test_it_exists
    converter = MarkDownConverter.new("Hello, World.")

    assert_instance_of MarkDownConverter, converter
  end

  def test_it_takes_input
    converter = MarkDownConverter.new("This is the first line of a paragraph.")

    assert_equal "This is the first line of a paragraph.", converter.markdown_text
  end

  def test_it_adds_html_paragraph_symbols
    converter = MarkDownConverter.new("This is the first line of a paragraph.")

    assert_equal "<p>This is the first line of a paragraph.</p>", converter.paragraph
  end

  def test_it_handles_single_line_breaks
    converter = MarkDownConverter.new("This is the first line of the paragraph.\nThis is the second line of the same paragraph.")

    assert_equal "<p>This is the first line of the paragraph. This is the second line of the same paragraph.</p>", converter.paragraph
  end

  def test_it_can_break_into_multiple_paragraphs
    converter = MarkDownConverter.new("This is the first line of the first paragraph.\n\nThis is the first line of the second paragraph.")

    assert_equal "<p>This is the first line of the first paragraph.</p>\n<p>This is the first line of the second paragraph.</p>", converter.paragraph
  end
end
