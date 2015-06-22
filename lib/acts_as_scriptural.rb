class ActsAsScriptural

  attr_accessor :chapters, :parsed

  def initialize
    @chapters = Array.new
  end

  def parse(str)
    references = str.split(',')
    references.each do |ref| 
      add_chapters(parse_a_reference(ref))
    end
    self
  end

  def parse_a_reference(reference)
    Parser.book_and_chapters_from_reference(reference)
  end

  def add_chapters(parsed)
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
