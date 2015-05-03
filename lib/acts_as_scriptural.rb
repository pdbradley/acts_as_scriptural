require_relative "acts_as_scriptural/version"
require_relative "acts_as_scriptural/book"
require 'pry'
require 'abbrev'

class ActsAsScriptural

  attr_accessor :valid, :errors, 
    :abbreviation_lookup_hash

  def initialize
    @data = Hash.new
    @chapters = Array.new
    @books = Array.new

    File.readlines("lib/acts_as_scriptural/data/english.txt").each do |line|
      book_name, book_index, num_chapters = line.chomp.split(',')
      @data[book_name] = Book.new(book_name, book_index.to_i, num_chapters.to_i)
    end

    @abbreviation_lookup_hash ||= data_book_names.abbrev.map{|k,v| [k.gsub(' ','').downcase,v]}.to_h
  end

  def parse(str)
    references = str.split(',')
    references.each {|ref| parse_reference(ref) }
    self
  end

  def book_and_chapters_from_reference(reference)
    regex = /^\s*([0-9]?\s*[a-zA-Z]+)\.?\s*([0-9]+)(?:\s*(?:-|..)[^0-9]*([0-9]+))?/
    match = reference.match(regex)
    if match
      if match[3]
        chapters = (match[2]..match[3]).to_a
      else
        chapters = [ match[2] ]
      end
      [ match[1], chapters.map(&:to_i) ]
    else
      [nil, nil]
    end
  end


  def parse_reference(reference)
    book, chapters = book_and_chapters_from_reference(reference)
    add_book(book)
    add_chapters(book, chapters)
  end

  def add_chapters(book, chapters)
    book_index = book_name_to_index(book)
    if book_index && chapters
      chapters.each do |c|
        @chapters << [book_index, c]
      end
    end
  end

  def add_book(str)
    book = @abbreviation_lookup_hash[str.gsub(' ','').downcase]
    @books << book if book
  end

  def book_names
    @books
  end

  def book_name_to_index(str)
    book = @abbreviation_lookup_hash[str.gsub(' ','').downcase]
    @data[book].index if book
  end

  private

  def data_book_names
    @data.map{|k,v| v.name }
  end


end
