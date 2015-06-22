


class ActsAsScriptural

  attr_accessor :chapters

  def initialize
    @chapters = Array.new
  end

  def parse(str)
    references = str.split(',')
    references.each {|ref| parse_a_reference(ref) }
    self
  end

  def parse_a_reference(reference)
    book, chapters = Parser.book_and_chapters_from_reference(reference)
    add_chapters(book, chapters)
  end

  def add_chapters(book, chapters)
    book_index = lookup.index_number(book)
    if book_index && chapters
      chapters.each do |c|
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
