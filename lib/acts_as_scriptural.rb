require_relative "acts_as_scriptural/version"
require_relative "acts_as_scriptural/bible_info"
require_relative "acts_as_scriptural/book"
require 'pry'

class ActsAsScriptural

  attr_accessor :valid, :errors

  def initialize
    @data = Hash.new

    File.readlines("lib/acts_as_scriptural/data/english.txt").each do |line|
      book_name, book_index, num_chapters = line.chomp.split(',')
      @data[book_index.to_i] = Book.new(book_name, book_index.to_i, num_chapters.to_i)
    end

    @abbreviation_lookup_hash ||= book_names.abbrev.map{|k,v| [k.strip.downcase,v]}.to_h
  end

  def parse

  end

  private

  def book_names
    @data.values.each {|i| i.book_name }
  end


end
