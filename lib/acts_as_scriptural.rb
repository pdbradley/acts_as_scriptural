class ActsAsScriptural

  attr_accessor :chapters, :parsed

  def initialize
    @chapters = Array.new
  end

  def parse(str)
    references = str.split(',')
    references.each do |ref| 
      add_chapters(Parser.new.parse_reference(ref))
    end
    self
  end

  def add_chapters(parsed_reference)
    for i in parsed_reference.first_book_index..parsed_reference.last_book_index do

      if (i == parsed_reference.first_book_index)
        first_chapter = parsed_reference.first_chapter
      else
        first_chapter = 1
      end

      if (i == parsed_reference.last_book_index)
        last_chapter = parsed_reference.last_chapter
      else
        last_chapter = bible.chapters_in_book(i)
      end

      for j in first_chapter..last_chapter
        @chapters << [i, j]
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
