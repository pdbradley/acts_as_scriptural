class ActsAsScriptural

  attr_accessor :chapters, :parsed

  def initialize
    @chapters = Array.new
  end

  def parse(str)
    references = str.split(',')
    references.each do |ref| 
      add_chapters(Parser.parse_reference(str))
    end
    self
  end

  def add_chapters(parsed_reference)
    binding.pry
    if parsed.start_book_index && parsed.chapters
      parsed.chapters.each do |c|
        @chapters << [book_index, c] if bible.chapter_exists?(book_index, c)
      end
    end
  end

  def bible
    @bible || Bible.new
  end

  def lookup
    @lookup || AbbreviationLookup.new
  end


end

require_relative "acts_as_scriptural/book"
require_relative "acts_as_scriptural/bible"
require_relative "acts_as_scriptural/parser"
require_relative "acts_as_scriptural/abbreviation_lookup"
require_relative "acts_as_scriptural/parsed_reference"
